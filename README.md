# Concourse Workshop

## Useful links:
- Concourse website: https://concourse-ci.org/ 
- Concourse Github Repo: https://github.com/concourse/concourse
- Slack Channel: https://concourse.slack.com/

---
## Lab 0: Setup
1. Visit https://concourse-workshop-toronto.ci.cf-app.com/ . The website will present a self signed certificate, please accept the exception accordingly depending on the browser you are using.
1. On the main page, you will see a link where you can download a CLI (Command Line Interface) that we will be using in the labs. Click on the icon corresponding to the OS you are currently using to download it. 
   - The CLI for concourse is named `fly`. Depending on the OS you are using, move this binary into the `PATH` of your shell. Or, you can keep it for now in a directory of your choice, and always reference it from there.
1. You will each be handed a piece of paper that has a username and password on it. Please try to login to the webapp to verify that your username and password works.
1. Visit this Github repository (the one you are currently at), and either clone it to your local machine, or download it directly from the github web interface.
1. We will need to use a text editor in our labs like SublimeText, Notepad++, etc... . Plesae make sure you have one installed.

---

## Lab 1: Log in using the CLI

In the terminal, run the following command to login:

Linux:
```bash
$ fly -t lab login -k -c https://concourse-workshop-toronto.ci.cf-app.com/ --team-name=<your-team> --username=<your-username> --password=<your-password>
```

Windows (Powershell):
```powershell
fly.exe login /k /t lab /c https://concourse-workshop-toronto.ci.cf-app.com/ /team-name:<your-team> /username:<your-user-name> /password:<your-password>
```

After logging in successfully, you should be able to run the `userinfo` command:

Linux:
```bash
fly -t lab userinfo
```

Windows (Powershell):
```powershell
fly.exe /t lab userinfo
```

... and get a result similar to this:
```
username   team/role
user-2025  team-2025/owner
```

---
## Lab 2: A Task

From within the `lab-2` directory, run the following command:

Linux:
```
fly -t lab execute -c task-1.yml 
```

Windows:
```powershell
fly.exe /t lab execute /c task-1.yml
```

Please take a moment to read the output of the command.

---
## Lab 3: A Task with an Input

From within the `lab-3` directory, run the following command:

Linux:
```
fly -t lab execute -c task-1.yml -i my-first-input=./dir-with-files
```

Windows:
```powershell
fly.exe /t lab execute /c .\task-1.yml /i my-first-input=.\dir-with-files\
```

---
## Lab 4: SSH into the Task Container

From within the `lab-4` directory, run the following command:

Linux:
```
fly -t lab execute -c task-1.yml -i my-input-4=./some-dir
```

Windows:
```powershell
fly.exe /t lab execute /c .\task-1.yml /i my-input-4=.\some-dir\
```

The output after running the command should contain the `build` number. We need this number to ssh into the container.

SSH into container:

Linux:
```
fly -t lab hijack -b <build-number>
```

Windows:
```powershell
fly.exe /t lab hijack /b <build-number>
```

You should land in a directory similar to `/tmp/build/xxxxxxx`. Explore around and see the input folder that was uploaded to the container.

---
## Lab 5: Run a Script which was Included in the Input

You may not be able to run this lab from a Windows machine. We'll demo it it from a Linux machine.

Linux:
```
fly -t lab execute -c task-1.yml -i my-input-5=./dir-containing-script
```

---
## Lab 6: A Basic Pipeline

Linux:
```
fly -t lab set-pipeline -p lab-6-pipeline -c lab-6-basic-pipeline.yml
```

Windows:
```
fly.exe -t lab set-pipeline /p lab-6-pipeline /c lab-6-basic-pipeline.yml
```

Navigate to the web app to unpause the pipline. After you unpause it, what do you notice?

---
## Lab 7: Introducing Resources

Linux:
```
fly -t lab set-pipeline -p lab-7-pipeline -c lab-7-pipeline-with-resource.yml
```

Windows:
```
fly.exe -t lab set-pipeline /p lab-7-pipeline /c lab-7-pipeline-with-resource.yml
```

Navigate to the web app to unpause the pipline. After you unpause it, the job should trigger every 30 seconds.

Please pause the pipeline when we are done this lab.

---
## Lab 8: Get Inputs from a Resource

Run the following commands:

Linux:
```
fly -t lab set-pipeline -p lab-8-pipeline -c lab-8-pipeline.yml
```

Windows:
```
fly.exe -t lab set-pipeline /p lab-8-pipeline /c lab-8-pipeline.yml
```

Unpause the pipeline and let it run. Explore the resource and task boxes using the web app.

---
## Lab 9: Multi-Task Job

Run the following commands:

Linux:
```
fly -t lab set-pipeline -p lab-9-pipeline -c lab-9-pipeline.yml
```

Windows:
```
fly.exe -t lab set-pipeline /p lab-9-pipeline /c lab-9-pipeline.yml
```

Unpause the pipeline and let it run. Check how the tasks will run serially.

---
## Lab 10: A Job with Parallel Tasks

Run the following commands:

Linux:
```
fly -t lab set-pipeline -p lab-10-pipeline -c lab-10-pipeline.yml
```

Windows:
```
fly.exe -t lab set-pipeline /p lab-10-pipeline /c lab-10-pipeline.yml
```

Unpause the pipeline and let it run. Check how the tasks will run in parallel.

---
## Lab 11: Passing Data between Tasks in a Job 

Run the following commands:

Linux:
```
fly -t lab set-pipeline -p lab-11-pipeline -c lab-11-pipeline.yml
```

Windows:
```
fly.exe -t lab set-pipeline /p lab-11-pipeline /c lab-11-pipeline.yml
```

Unpause the pipeline and let it run. Check how the tasks output.

---
## Lab 12: Multi Job Pipeline 

Run the following commands:

Linux:
```
fly -t lab set-pipeline -p lab-12-pipeline -c lab-12-pipeline.yml
```

Windows:
```
fly.exe -t lab set-pipeline /p lab-12-pipeline /c lab-12-pipeline.yml
```

Check how the jobs depends on each other, and the graph that gets created.

---
## Lab 13: Windows Support 

This is a pipeline that runs tasks on the windows worker.

Linux:
```
fly -t lab set-pipeline -p lab-13-pipeline -c lab-13-pipeline.yml
```

Windows:
```
fly.exe -t lab set-pipeline /p lab-13-pipeline /c lab-13-pipeline.yml
```

Check the output of the powershell script in the UI.
