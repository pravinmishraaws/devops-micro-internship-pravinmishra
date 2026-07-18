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

![echo $SHELL` and `bash --version](./screenshots/W3-SS-A5/W3-A5-SS-1.png)

---

#### Screenshot 2 — Output of `pwd` and `ls -lah` showing the scripts directory

![script dir](./screenshots/W3-SS-A5/W3-A5-SS-2.png)

---

### Notes

Answer the following in your own words:

**1. What is Bash?**

Bash is a command-line shell and scripting language. It's the default shell on most Linux systems and macOS, used to execute commands and automate tasks through scripts.

---

**2. What is the difference between shell and Bash?**

Shell is a generic command interpreter. Bash is a specific shell implementation with more features.

---

**3. Why is it important to confirm the Bash version before writing scripts?**

Different Bash versions support different features. Checking the version ensures your script will run without compatibility errors.

---

# Task 2 — Your First Bash Script

## Goal

Create your first Bash script, make it executable, and run it from the terminal.

### Evidence

#### Screenshot 1 — Content of `first-script.sh`

![first-script.sh](./screenshots/W3-SS-A5/W3-A5-SS-3.png)

---

#### Screenshot 2 — Output of `./first-script.sh`

![./first-script.sh](./screenshots/W3-SS-A5/W3-A5-SS-4.png)

---

#### Screenshot 3 — Output of `ls -l first-script.sh` showing executable permission

![ls -l first-script.sh](./screenshots/W3-SS-A5/W3-A5-SS-5.png)

---

### Notes

Answer the following in your own words:

**1. What is the purpose of `#!/bin/bash`?**

The shebang line (#!/bin/bash) tells the system which interpreter to use when running the script. It specifies that Bash should execute the script.

---

**2. Why do we use `chmod +x` before running a script?**

chmod +x makes the script executable by adding execute permissions. Without it, the system won't allow you to run it directly.

---

**3. What is the difference between running a script using `./script.sh` and `bash script.sh`?**

./script.sh runs the script as an executable file using the interpreter specified in the shebang. bash script.sh explicitly calls Bash to run the script.
Both work, but ./script.sh relies on execute permissions.

---

# Task 3 — Variables: User Information Script

## Goal

Use variables to store and display user-related information.

### Evidence

#### Screenshot 1 — Content of `user-info.sh`

![user-info.sh](./screenshots/W3-SS-A5/W3-A5-SS-6.png)

---

#### Screenshot 2 — Output of `./user-info.sh`

![Output user-info.sh](./screenshots/W3-SS-A5/W3-A5-SS-7.png)

---

### Notes

Answer the following in your own words:

**1. What is a variable in Bash?**

A variable is a container that stores data (text, numbers, etc.) that you can use and reference later in your script.

---

**2. Why should we avoid spaces around the `=` sign when creating variables?**

Spaces around the = sign cause Bash to interpret it as a command instead of an assignment, resulting in an error.

---

**3. How do you access the value stored inside a Bash variable?**

You access a variable's value by prefixing the variable name with a dollar sign ($), like $variable_name.

---

# Task 4 — Arrays & Loops: Tools Checklist Script

## Goal

Use arrays and loops to print a checklist of tools used in Bash scripting.

### Evidence

#### Screenshot 1 — Content of `tools-checklist.sh`

![Output user-info.sh](./screenshots/W3-SS-A5/W3-A5-SS-8.png)

---

#### Screenshot 2 — Output of `./tools-checklist.sh`

![./tools-checklist.sh](./screenshots/W3-SS-A5/W3-A5-SS-9.png)

---

### Notes

Answer the following in your own words:

**1. What is an array in Bash?**

An array is a variable that stores multiple values in a single container, allowing you to work with collections of data.

---

**2. Why are arrays useful in scripts?**

Arrays let you store and process multiple related values efficiently without creating separate variables for each one.

---

**3. What does `"${tools[@]}"` mean?**

It expands all elements of the tools array, allowing you to access and iterate through each value.

---

**4. What is the purpose of the `for` loop in this script?**

The for loop iterates through each element in an array, executing a set of commands for every value.

---

# Task 5 — Loops: Number Counter Script

## Goal

Use loops to repeat a task multiple times.

### Evidence

#### Screenshot 1 — Content of `counter.sh`

![counter.sh](./screenshots/W3-SS-A5/W3-A5-SS-10.png)

---

#### Screenshot 2 — Output of `./counter.sh`

![output counter.sh](./screenshots/W3-SS-A5/W3-A5-SS-11.png)

---

### Notes

Answer the following in your own words:

**1. What is a loop?**

A loop is a control structure in Bash that repeats a block of code multiple times. It automates executing the same commands without writing them repeatedly.

---

**2. Why do we use loops in Bash scripting?**

We use loops to automate repetitive tasks, process multiple items efficiently, and reduce code duplication. Instead of writing the same command 5 times, a loop does it in a few lines.

---

**3. How many times did the loop run in your script?**

The loop ran 5 times, iterating over the values: 1, 2, 3, 4, 5 (one iteration per number in the `for number in 1 2 3 4 5` list).

---

**4. What would you change if you wanted the loop to run 10 times?**

```bash
for number in 1 2 3 4 5 6 7 8 9 10
```

Or use a range (cleaner):
```bash
for number in {1..10}
```

---

# Task 6 — Files & Conditionals: File Validation Script

## Goal

Use file checks and conditionals to verify whether files and directories exist.

### Evidence

#### Screenshot 1 — Output of `ls -lah ../test-folder`

![ls -lah ../test-folder](./screenshots/W3-SS-A5/W3-A5-SS-12.png)

---

#### Screenshot 2 — Content of `file-check.sh`

![Content of `file-check.sh](./screenshots/W3-SS-A5/W3-A5-SS-13.png)

---

#### Screenshot 3 — Output of `./file-check.sh`

![Output of `./file-check.sh`](./screenshots/W3-SS-A5/W3-A5-SS-14.png)

---

### Notes

Answer the following in your own words:

**1. What does `-d` check in Bash?**

Add your answer here.

---

**2. What does `-f` check in Bash?**

The `-f` operator checks if a file exists and is a regular file (not a directory). It returns true if the file exists, false if it doesn't. Used in conditional statements like: `if [ -f "$filename" ]`

---

**3. Why should file and directory paths be stored in variables?**

Storing paths in variables improves maintainability, reduces errors, and makes scripts reusable. If a path changes, you only update it in one place. It also protects against typos and makes the script more readable.

---

**4. What happens if the file does not exist?**

If the file does not exist, the `-f` test returns false, and the code block in the `if [ -f "$file" ]` condition is skipped. Typically, an `else` block handles the missing file scenario (error message, file creation, etc.).

---

# Task 7 — Conditionals: Pass or Retry Script

## Goal

Use if-else conditionals to make decisions based on a variable value.

### Evidence

#### Screenshot 1 — Content of `score-check.sh` with `score=85`

![score-check.sh` with `score=85`](./screenshots/W3-SS-A5/W3-A5-SS-15.png)

---

#### Screenshot 2 — Output showing `Result: Pass`

![pass](./screenshots/W3-SS-A5/W3-A5-SS-15-1.png)

---

#### Screenshot 3 — Content of `score-check.sh` with `score=55`

![content 55](./screenshots/W3-SS-A5/W3-A5-SS-15-55.png)

---

#### Screenshot 4 — Output showing `Result: Retry`

![score 55](./screenshots/W3-SS-A5/W3-A5-SS-15-55-1.png)

---

### Notes

Answer the following in your own words:

**1. What is the purpose of if-else in Bash?**

The purpose of if-else is to make decisions in a script. It allows code to branch based on conditions—if a condition is true, one block executes; if false, an alternative block (else) executes. This enables scripts to respond differently based on test results.

---

**2. What does `-ge` mean?**

The `-ge` operator means "greater than or equal to". It compares two numbers and returns true if the first value is greater than or equal to the second. Used in conditionals like: `if [ $age -ge 18 ]`

---

**3. Why should conditions be tested with different values?**

Testing with different values verifies that your conditional logic works correctly in all scenarios—true cases, false cases, and edge cases (boundary values). This prevents bugs and ensures the script behaves as intended regardless of input.

---

**4. How can conditionals help in automation scripts?**

Conditionals make automation scripts adaptive and resilient. They allow scripts to check file existence, validate input, handle errors gracefully, and take appropriate actions without manual intervention. This prevents failures and makes scripts safer and more reliable.

---

# Task 8 — Functions: Final Bash Automation Script

## Goal

Create a final Bash script using functions to organize reusable code.

### Evidence

#### Screenshot 1 — Content of `final-automation.sh`

![Content of `final-automation.sh`](./screenshots/W3-SS-A5/W3-A5-SS-16.png)

---

#### Screenshot 2 — Output of `./final-automation.sh`

![Output of `./final-automation.sh``](./screenshots/W3-SS-A5/W3-A5-SS-17.png)

---

#### Screenshot 3 — Output of `ls -lah` showing all created scripts

![Output of `ls -lah`](./screenshots/W3-SS-A5/W3-A5-SS-18.png)

---

### Notes

Answer the following in your own words:

**1. What is a function in Bash?**

A function is a reusable block of code that performs a specific task. It allows you to group commands together and call them by name, avoiding repetition and making scripts more organized and maintainable.

---

**2. Why are functions useful in scripts?**

Functions are useful because they reduce code duplication, improve readability, make scripts easier to maintain and debug, and allow you to organize complex logic into logical sections. If a function's logic needs to change, you only update it once.

---

**3. Which functions did you create in this script?**

- `print_header()` — Displays a formatted header with the assignment name
- `print_user_details()` — Shows the full name and assignment name
- `check_files()` — Tests if a directory and file exist using `-d` and `-f` operators
- `print_tools()` — Loops through the tools array and displays each one


---

**4. How does this final script combine variables, arrays, loops, conditionals, files, and functions?**

The script demonstrates all concepts working together: 
Variables store paths and metadata (full_name, assignment_name). 
Arrays hold the tools list. 
Functions organize the logic into reusable blocks. 
Conditionals check if files/directories exist. 
Loops iterate through the tools array. 
Files are validated using `-d` and `-f` tests. The main script calls functions sequentially, creating a complete automation workflow that checks system setup, validates resources, and reports results.

---

# LinkedIn Post (Required)

## Evidence

#### LinkedIn Post URL

https://www.linkedin.com/posts/ronnie-santos-131856184_bash-script-automation-drill-assignment-share-7484155565318012930-Riw9/?utm_source=share&utm_medium=member_desktop&rcm=ACoAACuNXjUByrzjuiXUdcAXl7CkJp7IYHpF-S8

---

#### Screenshot — Published LinkedIn post

![LinkedIn post](./screenshots/W3-SS-A5/W3-A5-SS-19.png)

---

# Submission Instructions

- Add all required screenshots in your submission
- Full name must be visible in required screenshots
- All script files must be created and run successfully
- Required notes must be answered clearly for every task
- Do not expose sensitive information (keys, passwords, credentials)

---

# Completion Checklist

- [✓] Task 1: Environment setup verified, workspace created (Screenshots 1–2, Notes answered)
- [✓] Task 2: First script created, executed, permissions verified (Screenshots 1–3, Notes answered)
- [✓] Task 3: Variables script created and run (Screenshots 1–2, Notes answered)
- [✓] Task 4: Arrays and loops script created and run (Screenshots 1–2, Notes answered)
- [✓] Task 5: Counter loop script created and run (Screenshots 1–2, Notes answered)
- [✓] Task 6: File validation script created and run (Screenshots 1–3, Notes answered)
- [✓] Task 7: Pass/Retry conditional script tested with both values (Screenshots 1–4, Notes answered)
- [✓] Task 8: Final automation script created and run (Screenshots 1–3, Notes answered)
- [✓] All scripts run without errors
- [✓] Full Name visible in all required screenshots
- [✓] LinkedIn post published and URL submitted
- [✓] No sensitive data exposed

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