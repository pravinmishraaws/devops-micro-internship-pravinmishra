# Assignment 5 — Bash Script Automation Drill (OPS Checklist)

Part of the DevOps Micro Internship (DMI) Cohort 3 with Agentic AI

---

## Purpose

In this assignment, you will practice Bash scripting by building a series of small automation scripts covering environment setup, variables, arrays, loops, file conditionals, if-else logic, and functions. These scripts form the foundation of real-world Linux automation used in DevOps, cloud, and production support environments.

---

# Task 1 — Bash Environment & Workspace Setup

## Goal

Verify that Bash is available on your system and create a clean workspace for this assignment.

### Evidence

#### Screenshot 1 — Output of `echo $SHELL` and `bash --version`

![bash-version](/week-03-linux-and-bash-for-devops/screenshots/bash-version-local.png)

---

#### Screenshot 2 — Output of `pwd` and `ls -lah` showing the scripts directory

![scripts-folder-display](/week-03-linux-and-bash-for-devops/screenshots/scripts-folder-display.png)
![scripts-folder-display](/week-03-linux-and-bash-for-devops/screenshots/scripts-folder.png)

---

### Notes

Answer the following in your own words:

**1. What is Bash?**

Bash (Bourne Again SHell) is a command line shell and scripting language commonly used on Linux and Unix like operating systems. It provides a text based interface that allows users to interact with the operating system by running commands, automating tasks, and managing files, processes, and system resources.

---

**2. What is the difference between shell and Bash?**

A shell is a general program that provides an interface between the user and the operating system, while Bash is a specific type of shell. **SHELL** is a general term for a command line interpreter while a **BASH** is a specific shell called Bourne Again SHell.

---

**3. Why is it important to confirm the Bash version before writing scripts?**

It is important to confirm the Bash version before writing or running scripts because different Bash versions support different features. A script that works on one system may fail on another if it relies on features that are not available in the installed version. Other reasons to check the version of BASH you have include- to avoid run time errors, also Knowing the Bash version helps you write scripts that work across different Linux distributions and environments.

---

# Task 2 — Your First Bash Script

## Goal

Create your first Bash script, make it executable, and run it from the terminal.

### Evidence

#### Screenshot 1 — Content of `first-script.sh`

![batch-script-content](/week-03-linux-and-bash-for-devops/screenshots/first-batch-script.png)

---

#### Screenshot 2 — Output of `./first-script.sh`

![first-script-output](/week-03-linux-and-bash-for-devops/screenshots/output-permission-denied.png)

![first-script-output](/week-03-linux-and-bash-for-devops/screenshots/first-script-output.png)

---

#### Screenshot 3 — Output of `ls -l first-script.sh` showing executable permission

![executable-mode](/week-03-linux-and-bash-for-devops/screenshots/exec-permission.png)

---

### Notes

Answer the following in your own words:

**1. What is the purpose of `#!/bin/bash`?**

The line #!/bin/bash is called a shebang (or hashbang). The purpose is to tell the operating system which interpreter should be used to execute the script.

---

**2. Why do we use `chmod +x` before running a script?**

We use chmod +x to make a script executable. By default, a script is just a regular text file, so the operating system will not allow it to be run directly.

---

**3. What is the difference between running a script using `./script.sh` and `bash script.sh`?**

Both commands run a Bash script, but they do so in different ways. **`./script.sh`** executes the script directly as a program  while **bash script.sh** starts a new Bash process and passes the script to it. **`./script.sh`** uses the interpreter specified by the script's shebang while **`bash script.sh`** ignores the shebang and explicitly runs the script with Bash.

---

# Task 3 — Variables: User Information Script

## Goal

Use variables to store and display user-related information.

### Evidence

#### Screenshot 1 — Content of `user-info.sh`

![content-userinfo](/week-03-linux-and-bash-for-devops/screenshots/user-info-content.png)

---

#### Screenshot 2 — Output of `./user-info.sh`

![output-user-info](/week-03-linux-and-bash-for-devops/screenshots/output-userinfo.png)

---

### Notes

Answer the following in your own words:

**1. What is a variable in Bash?**

A variable in Bash is a named container used to store data, such as text, numbers, file paths, or the output of commands. Variables make scripts more flexible by allowing values to be reused and changed without modifying the script logic.

---

**2. Why should we avoid spaces around the `=` sign when creating variables?**

In Bash, you should avoid spaces around the = sign because the shell interprets spaces as argument separators, not as part of a variable assignment.

---

**3. How do you access the value stored inside a Bash variable?**

You access the value stored in a Bash variable by prefixing the variable name with a $ (dollar sign).

---

# Task 4 — Arrays & Loops: Tools Checklist Script

## Goal

Use arrays and loops to print a checklist of tools used in Bash scripting.

### Evidence

#### Screenshot 1 — Content of `tools-checklist.sh`

![tools-checklist-content-display](/week-03-linux-and-bash-for-devops/screenshots/tools-checklist-content.png)

---

#### Screenshot 2 — Output of `./tools-checklist.sh`

![toolkit-output](/week-03-linux-and-bash-for-devops/screenshots/checklist-output.png)

---

### Notes

Answer the following in your own words:

**1. What is an array in Bash?**

In Bash, an array is a variable that can store multiple values under a single name. Each value is stored at a numbered position called an index.

---

**2. Why are arrays useful in scripts?**

Arrays are useful in Bash scripts because they let you store and manage multiple related values efficiently instead of creating many separate variables.

---

**3. What does `"${tools[@]}"` mean?**

In Bash, "${tools[@]}" is a way to expand all elements of an array while preserving each element as a separate argument.

---

**4. What is the purpose of the `for` loop in this script?**

The purpose of a for loop in a Bash script is to repeat a set of commands multiple times, usually once for each item in a list, array, or sequence. A for loop helps automate repetitive tasks without writing the same commands over and over.

---

# Task 5 — Loops: Number Counter Script

## Goal

Use loops to repeat a task multiple times.

### Evidence

#### Screenshot 1 — Content of `counter.sh`

![counter-content](/week-03-linux-and-bash-for-devops/screenshots/counter-content.png)

---

#### Screenshot 2 — Output of `./counter.sh`

![counter-output](/week-03-linux-and-bash-for-devops/screenshots/counter-output.png)

---

### Notes

Answer the following in your own words:

**1. What is a loop?**

A loop is a programming structure that repeats a set of instructions multiple times until a certain condition is met or until it has processed all items in a list. Instead of writing the same command repeatedly

---

**2. Why do we use loops in Bash scripting?**

We use loops in Bash scripting to automate repetitive tasks by allowing a script to run the same set of commands multiple times without writing them repeatedly.

---

**3. How many times did the loop run in your script?**

5 times

---

**4. What would you change if you wanted the loop to run 10 times?**

my **for number in 1 2 3 4 5** line will increase to **for number in 1 2 3 4 5 6 7 8 9 10**

---

# Task 6 — Files & Conditionals: File Validation Script

## Goal

Use file checks and conditionals to verify whether files and directories exist.

### Evidence

#### Screenshot 1 — Output of `ls -lah ../test-folder`

![test-folder](/week-03-linux-and-bash-for-devops/screenshots/test-folder.png)

---

#### Screenshot 2 — Content of `file-check.sh`

![filecheck-content](/week-03-linux-and-bash-for-devops/screenshots/filecheck-content.png)

---

#### Screenshot 3 — Output of `./file-check.sh`

![filecheck-output](/week-03-linux-and-bash-for-devops/screenshots/filecheck-output.png)

---

### Notes

Answer the following in your own words:

**1. What does `-d` check in Bash?**

In Bash, -d is a file test operator that checks whether a given path exists and is a directory. It is commonly used inside an if statement

---

**2. What does `-f` check in Bash?**
In Bash, -f is a file test operator that checks whether a given path exists and is a regular file (a normal file, not a directory or special file).

---

**3. Why should file and directory paths be stored in variables?**
Storing file and directory paths in variables in Bash scripts is useful because it makes scripts easier to read, modify, and maintain, instead of repeating a path many times.

---

**4. What happens if the file does not exist?**

if the file does not exist, it will return an error message stating that the file does not exist.

---

# Task 7 — Conditionals: Pass or Retry Script

## Goal

Use if-else conditionals to make decisions based on a variable value.

### Evidence

#### Screenshot 1 — Content of `score-check.sh` with `score=85`

![score-85](/week-03-linux-and-bash-for-devops/screenshots/score-content.png)

---

#### Screenshot 2 — Output showing `Result: Pass`

![result-85](/week-03-linux-and-bash-for-devops/screenshots/result-85.png)

---

#### Screenshot 3 — Content of `score-check.sh` with `score=55`

![score-55](/week-03-linux-and-bash-for-devops/screenshots/score-55.png)

---

#### Screenshot 4 — Output showing `Result: Retry`

![result-55](/week-03-linux-and-bash-for-devops/screenshots/result-55.png)

---

### Notes

Answer the following in your own words:

**1. What is the purpose of if-else in Bash?**

The purpose of an if-else statement in Bash is to allow a script to make decisions by running different commands depending on whether a condition is true or false. It gives a script the ability to respond differently to different situations.

---

**2. What does `-ge` mean?**

In Bash, -ge means "greater than or equal to". It is a numeric comparison operator used to compare two numbers.
It is commonly used inside an if statement with [].

---

**3. Why should conditions be tested with different values?**

Conditions in Bash scripts should be tested with different values to make sure the script behaves correctly in all possible situations, not just the one case you first tried.

---

**4. How can conditionals help in automation scripts?**

Conditionals help in automation scripts by allowing the script to make decisions and take different actions based on the current situation. They make scripts smarter because the script can check conditions before performing tasks.

---

# Task 8 — Functions: Final Bash Automation Script

## Goal

Create a final Bash script using functions to organize reusable code.

### Evidence

#### Screenshot 1 — Content of `final-automation.sh`

![final-script-content](/week-03-linux-and-bash-for-devops/screenshots/final-script-content.png)

---

#### Screenshot 2 — Output of `./final-automation.sh`

![final-script-result](/week-03-linux-and-bash-for-devops/screenshots/final-script-result.png)

---

#### Screenshot 3 — Output of `ls -lah` showing all created scripts

![all-scripts](/week-03-linux-and-bash-for-devops/screenshots/all-scripts.png)

---

### Notes

Answer the following in your own words:

**1. What is a function in Bash?**

In Bash, a function is a named group of commands that you can define once and run (call) multiple times in a script.
Functions help organize scripts, reduce repeated code, and make scripts easier to read and maintain.

---

**2. Why are functions useful in scripts?**

Functions are useful in Bash scripts because they help you organize, reuse, and manage code more effectively. Avoid repeating code. Make scripts easier to read, 

---

**3. Which functions did you create in this script?**

print_header(), print_user_details(), check_files(), print_tools()

---

**4. How does this final script combine variables, arrays, loops, conditionals, files, and functions?**

This final Bash script combines variables, arrays, loops, conditionals, files, and functions to create a structured automation script where each part has a specific role.
The script uses variables to store important values, the script uses Arrays to store multiple related values, The script uses four functions to divide the script into smaller, organized sections, it also uses conditionals for decision making- these conditions allow the script to decide whether a directory exists, a file exists, and respond appropriately. It uses **-d** to check for a directory and **-f** to check for a regular file this helps confirm that required resources are available before continuing. it uses Loops to process multiple items, the loop goes through each item in the array and prints it individually.

---

# LinkedIn Post (Required)

## Evidence

#### LinkedIn Post URL

Paste your LinkedIn post URL here:

<https://www.linkedin.com/posts/wisgeorge1_devops-cloudengineering-bashscripting-share-7483983597662642176-fwCr/?utm_source=share&utm_medium=member_desktop&rcm=ACoAADp8HhoB_UGFhHiID8Ba-4DVResYfMJJsuY>`

---

#### Screenshot — Published LinkedIn post

![bash-post](/week-03-linux-and-bash-for-devops/screenshots/bash-post-linkedin.png)

---

# Submission Instructions

- Add all required screenshots in your submission
- Full name must be visible in required screenshots
- All script files must be created and run successfully
- Required notes must be answered clearly for every task
- Do not expose sensitive information (keys, passwords, credentials)

---

# Completion Checklist

- [ ] Task 1: Environment setup verified, workspace created (Screenshots 1–2, Notes answered)
- [ ] Task 2: First script created, executed, permissions verified (Screenshots 1–3, Notes answered)
- [ ] Task 3: Variables script created and run (Screenshots 1–2, Notes answered)
- [ ] Task 4: Arrays and loops script created and run (Screenshots 1–2, Notes answered)
- [ ] Task 5: Counter loop script created and run (Screenshots 1–2, Notes answered)
- [ ] Task 6: File validation script created and run (Screenshots 1–3, Notes answered)
- [ ] Task 7: Pass/Retry conditional script tested with both values (Screenshots 1–4, Notes answered)
- [ ] Task 8: Final automation script created and run (Screenshots 1–3, Notes answered)
- [ ] All scripts run without errors
- [ ] Full Name visible in all required screenshots
- [ ] LinkedIn post published and URL submitted
- [ ] No sensitive data exposed

---

## 📌 About DMI & CloudAdvisory

DevOps Micro Internship (DMI) is a project-based DevOps program run by Pravin Mishra (The CloudAdvisory) focused on real-world execution, systems thinking, and career readiness.

It helps learners build strong DevOps foundations with hands-on experience.

---

## 📌 Resources

- 🌐 DMI Official Website: https://pravinmishra.com/dmi  
- 🎓 DevOps for Beginners (Udemy): https://www.udemy.com/course/devops-for-beginners-docker-k8s-cloud-cicd-4-projects/  
- 🎓 Agentic AI DevOps with Claude Code: https://www.udemy.com/course/ultimate-agentic-ai-devops-with-claude-code/  
- 🎓 DevOps with Claude Code: Terraform, EKS, ArgoCD & Helm: https://www.udemy.com/course/devops-with-claude-code-terraform-eks-argocd-helm/  
- ▶️ YouTube Playlist: https://www.youtube.com/playlist?list=PLFeSNDtI4Cho  
- 🔗 Pravin Mishra (LinkedIn): https://www.linkedin.com/in/pravin-mishra-aws-trainer/  
- 🏢 CloudAdvisory (LinkedIn): https://www.linkedin.com/company/thecloudadvisory/

---

*This submission is part of DevOps Micro Internship (DMI) Cohort 3 — Agentic AI Track.*