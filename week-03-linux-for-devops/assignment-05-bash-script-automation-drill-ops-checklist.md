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

![alt text](image-46.png)

---

#### Screenshot 2 — Output of `pwd` and `ls -lah` showing the scripts directory

![alt text](image-47.png)

---

### Notes

Answer the following in your own words:

**1. What is Bash?**

Bash is a command-line shell that lets you interact with the operating system by running commands and writing scripts to automate tasks.

---

**2. What is the difference between shell and Bash?**

A shell is any program that lets you communicate with the operating system. Bash is one specific type of shell and is one of the most commonly used on Linux.

---

**3. Why is it important to confirm the Bash version before writing scripts?**

Different Bash versions support different features. Checking the version helps make sure your script will work correctly on that system.

---

# Task 2 — Your First Bash Script

## Goal

Create your first Bash script, make it executable, and run it from the terminal.

### Evidence

#### Screenshot 1 — Content of `first-script.sh`

![alt text](image-48.png)

---

#### Screenshot 2 — Output of `./first-script.sh`

![alt text](image-49.png)

---

#### Screenshot 3 — Output of `ls -l first-script.sh` showing executable permission

![alt text](image-50.png)

---

### Notes

Answer the following in your own words:

**1. What is the purpose of `#!/bin/bash`?**

#!/bin/bash tells the system to use the Bash shell to run the script. It makes sure the script is executed using Bash, even if another shell is the default.

---

**2. Why do we use `chmod +x` before running a script?**

We use chmod +x to make the script executable. Without it, Linux treats the file as a normal text file and won't let you run it directly.

---

**3. What is the difference between running a script using `./script.sh` and `bash script.sh`?**

./script.sh runs the script directly, so the script must be executable and usually include the #!/bin/bash line. bash script.sh runs the script using the Bash interpreter, so it works even if the script doesn't have execute permission.

---

# Task 3 — Variables: User Information Script

## Goal

Use variables to store and display user-related information.

### Evidence

#### Screenshot 1 — Content of `user-info.sh`

![alt text](image-53.png)

---

#### Screenshot 2 — Output of `./user-info.sh`

![alt text](image-52.png)

---

### Notes

Answer the following in your own words:

**1. What is a variable in Bash?**

A variable is a name used to store a value that can be used later in a Bash script.

---

**2. Why should we avoid spaces around the `=` sign when creating variables?**

Because Bash treats spaces as separate commands or arguments, so the variable won't be created correctly.

---

**3. How do you access the value stored inside a Bash variable?**

Use the $ symbol before the variable name, for example, $name.

---

# Task 4 — Arrays & Loops: Tools Checklist Script

## Goal

Use arrays and loops to print a checklist of tools used in Bash scripting.

### Evidence

#### Screenshot 1 — Content of `tools-checklist.sh`

![alt text](image-55.png)

---

#### Screenshot 2 — Output of `./tools-checklist.sh`

![alt text](image-56.png)
---

### Notes

Answer the following in your own words:

**1. What is an array in Bash?**

An array is a variable that can store multiple values in a single place.

---

**2. Why are arrays useful in scripts?**

They make it easy to store and work with a list of related items.

---

**3. What does `"${tools[@]}"` mean?**

It means "use all the values stored in the tools array."

---

**4. What is the purpose of the `for` loop in this script?**

The for loop goes through each item in the array and performs the same action for each one.

---

# Task 5 — Loops: Number Counter Script

## Goal

Use loops to repeat a task multiple times.

### Evidence

#### Screenshot 1 — Content of `counter.sh`

![alt text](image-57.png)

---

#### Screenshot 2 — Output of `./counter.sh`

![alt text](image-58.png)

---

### Notes

Answer the following in your own words:

**1. What is a loop?**

A loop is used to repeat the same task multiple times.

---

**2. Why do we use loops in Bash scripting?**

Loops save time by repeating commands automatically.

---

**3. How many times did the loop run in your script?**

The loop ran 5 times.

---

**4. What would you change if you wanted the loop to run 10 times?**

I would change the numbers to 1 2 3 4 5 6 7 8 9 10.

---

# Task 6 — Files & Conditionals: File Validation Script

## Goal

Use file checks and conditionals to verify whether files and directories exist.

### Evidence

#### Screenshot 1 — Output of `ls -lah ../test-folder`

![alt text](image-59.png)

---

#### Screenshot 2 — Content of `file-check.sh`

![alt text](image-60.png)

---

#### Screenshot 3 — Output of `./file-check.sh`

![alt text](image-61.png)

---

### Notes

Answer the following in your own words:

**1. What does `-d` check in Bash?**

It checks if a directory exists.

---

**2. What does `-f` check in Bash?**

It checks if a file exists.

---

**3. Why should file and directory paths be stored in variables?**

It makes the script easier to read and update.

---

**4. What happens if the file does not exist?**

The script lets you know the file doesn't exist and continues running.

---

# Task 7 — Conditionals: Pass or Retry Script

## Goal

Use if-else conditionals to make decisions based on a variable value.

### Evidence

#### Screenshot 1 — Content of `score-check.sh` with `score=85`

![alt text](image-62.png)

---

#### Screenshot 2 — Output showing `Result: Pass`

![alt text](image-63.png)

---

#### Screenshot 3 — Content of `score-check.sh` with `score=55`

![alt text](image-65.png)

---

#### Screenshot 4 — Output showing `Result: Retry`

![alt text](image-64.png)

---

### Notes

Answer the following in your own words:

**1. What is the purpose of if-else in Bash?**

It lets the script make decisions based on a condition.

---

**2. What does `-ge` mean?**

It means greater than or equal to.

---

**3. Why should conditions be tested with different values?**

To make sure the script works correctly in different situations.

---

**4. How can conditionals help in automation scripts?**

They allow the script to take different actions depending on the result.

---

# Task 8 — Functions: Final Bash Automation Script

## Goal

Create a final Bash script using functions to organize reusable code.

### Evidence

#### Screenshot 1 — Content of `final-automation.sh`

![alt text](image-66.png)

![alt text](image-67.png)

---

#### Screenshot 2 — Output of `./final-automation.sh`

![alt text](image-68.png)

---

#### Screenshot 3 — Output of `ls -lah` showing all created scripts

![alt text](image-69.png)
---

### Notes

Answer the following in your own words:

**1. What is a function in Bash?**

A function is a block of code that does a specific task.

---

**2. Why are functions useful in scripts?**

They keep the script neat and save you from repeating code.

---

**3. Which functions did you create in this script?**

I created print_header, print_user_details, check_files, and print_tools.

---

**4. How does this final script combine variables, arrays, loops, conditionals, files, and functions?**

It uses variables to store values, an array to store tools, a loop to go through the tools, conditionals to check files and folders, and functions to organise the script.

---

# LinkedIn Post (Required)

## Evidence

#### LinkedIn Post URL

Paste your LinkedIn post URL here:

https://www.linkedin.com/posts/ibitoye-oloni_devops-aws-linux-share-7483576101680783360-2p22/?utm_source=share&utm_medium=member_desktop&rcm=ACoAAABp_1YBcUgsxYJIdRCX9CFvm17K_adeV6E

---

#### Screenshot — Published LinkedIn post

![alt text](image-97.png)

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