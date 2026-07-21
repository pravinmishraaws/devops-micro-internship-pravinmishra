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

![screenshot_1](screenshots/assignment5-ss1.jpg)

---

#### Screenshot 2 — Output of `pwd` and `ls -lah` showing the scripts directory

![screenshot_2](screenshots/assignment5-ss2.jpg)
![screenshot_2](screenshots/assignment5-ss2.1.jpg)

---

### Notes

Answer the following in your own words:

**1. What is Bash?**

Bash (Bourne Again SHell) is a command-line shell and scripting language commonly used on Linux and Unix-based operating systems. It allows users to interact with the operating system by executing commands, managing files, automating tasks, and writing scripts.

---

**2. What is the difference between shell and Bash?**


A shell is a program that provides a command-line interface between the user and the operating system. While Bash (Bourne Again SHell) is a specific type of shell.

---

**3. Why is it important to confirm the Bash version before writing scripts?**

It is important to confirm the Bash version before writing scripts because different Bash versions support different features and syntax. A script that works on a newer version of Bash may fail on an older version if it uses unsupported commands or functionality.

Checking the Bash version helps ensure:
- Compatibility across different Linux systems.
- Reliable script execution without unexpected errors.
- Access to the required features, such as associative arrays, improved parameter expansion, or newer built-in commands.

---

# Task 2 — Your First Bash Script

## Goal

Create your first Bash script, make it executable, and run it from the terminal.

### Evidence

#### Screenshot 1 — Content of `first-script.sh`

![screenshot_1](screenshots/assignment5-ss3.jpg)

---

#### Screenshot 2 — Output of `./first-script.sh`

![screenshot_2](screenshots/assignment5-ss4.jpg)

---

#### Screenshot 3 — Output of `ls -l first-script.sh` showing executable permission

![screenshot_3](screenshots/assignment5-ss5.jpg)

---

### Notes

Answer the following in your own words:

**1. What is the purpose of `#!/bin/bash`?**

#!/bin/bash is a shebang line that tells the operating system to execute the script using the Bash interpreter. It ensures the script runs with the correct shell, providing consistent behavior and compatibility across Linux systems.

---

**2. Why do we use `chmod +x` before running a script?**

We use chmod +x to make a script executable. By default, a newly created script is usually just a regular file, so the operating system will not allow it to be run directly. We use chmod +x to grant execute permission to a script, allowing it to be run directly as a program.

---

**3. What is the difference between running a script using `./script.sh` and `bash script.sh`?**

./script.sh executes the script directly and requires execute permission, using the interpreter specified in the shebang. 

bash script.sh explicitly runs the script with the Bash interpreter and does not require the script to have execute permission, making it useful for testing or running scripts without modifying file permissions.

---

# Task 3 — Variables: User Information Script

## Goal

Use variables to store and display user-related information.

### Evidence

#### Screenshot 1 — Content of `user-info.sh`

![screenshot_1](screenshots/assignment5-ss6.jpg)

---

#### Screenshot 2 — Output of `./user-info.sh`

![screenshot_2](screenshots/assignment5-ss7.jpg)

---

### Notes

Answer the following in your own words:

**1. What is a variable in Bash?**

A variable in Bash is a named container used to store data, such as text, numbers, file paths, or command output. Variables make scripts more flexible and reusable by allowing values to be stored and referenced throughout the script.

---

**2. Why should we avoid spaces around the `=` sign when creating variables?**

We avoid spaces around the = sign because Bash requires variable assignments to be written without spaces. If spaces are added, Bash interprets the statement as a command with arguments instead of a variable assignment, resulting in an error.

---

**3. How do you access the value stored inside a Bash variable?**

I accessed the value of a Bash variable by placing a $ before the variable name, for example, echo $name. The dollar sign tells Bash to substitute the variable with its stored value.

---

# Task 4 — Arrays & Loops: Tools Checklist Script

## Goal

Use arrays and loops to print a checklist of tools used in Bash scripting.

### Evidence

#### Screenshot 1 — Content of `tools-checklist.sh`

![screenshot_1](screenshots/assignment5-ss8.jpg)

---

#### Screenshot 2 — Output of `./tools-checklist.sh`

![screenshot_2](screenshots/assignment5-ss9.jpg)

---

### Notes

Answer the following in your own words:

**1. What is an array in Bash?**

An array in Bash is a variable that can store multiple values under a single name. Instead of creating separate variables for related data, you can store all the values in one array and access them by their index.

---

**2. Why are arrays useful in scripts?**

Arrays are useful in Bash scripts because they allow you to store and manage multiple related values in a single variable. This makes scripts more organized, scalable, and easier to maintain, especially when working with lists of files, servers, users, or IP addresses.

---

**3. What does `"${tools[@]}"` mean?**

"${tools[@]}" is a Bash expression that expands to all elements of the tools array, treating each element as a separate quoted argument. This is the recommended way to iterate over or pass all array elements, especially when elements may contain spaces.

---

**4. What is the purpose of the `for` loop in this script?**

The purpose of the for loop in a Bash script is to repeat a set of commands for each item in a list or array. This eliminates the need to write the same code multiple times and makes scripts more efficient and easier to maintain.

---

# Task 5 — Loops: Number Counter Script

## Goal

Use loops to repeat a task multiple times.

### Evidence

#### Screenshot 1 — Content of `counter.sh`

![screenshot_1](screenshots/assignment5-ss10.jpg)

---

#### Screenshot 2 — Output of `./counter.sh`

![screenshot_2](screenshots/assignment5-ss11.jpg)

---

### Notes

Answer the following in your own words:

**1. What is a loop?**

A loop is a programming construct that repeats a block of code multiple times until a condition is met or all items in a collection have been processed. Loops help automate repetitive tasks, making scripts shorter, more efficient, and easier to maintain.

---

**2. Why do we use loops in Bash scripting?**

We use loops in Bash scripting to automate repetitive tasks by executing the same block of code multiple times. Instead of writing the same commands repeatedly, a loop processes each item in a list or continues until a specified condition is met.

---

**3. How many times did the loop run in your script?**

The loop ran 4 times because the tools array contained four elements. A for loop executes once for each item in the array.

---

**4. What would you change if you wanted the loop to run 10 times?**

To make the loop run 10 times, I would iterate over a range of numbers from 1 to 10, for example using for i in {1..10}. This causes the loop to execute once for each number in the range, resulting in 10 iterations.

---

# Task 6 — Files & Conditionals: File Validation Script

## Goal

Use file checks and conditionals to verify whether files and directories exist.

### Evidence

#### Screenshot 1 — Output of `ls -lah ../test-folder`

![screenshot_1](screenshots/assignment5-ss12.jpg)

---

#### Screenshot 2 — Content of `file-check.sh`

![screenshot_2](screenshots/assignment5-ss13.jpg)

---

#### Screenshot 3 — Output of `./file-check.sh`

![screenshot_3](screenshots/assignment5-ss14.jpg)

---

### Notes

Answer the following in your own words:

**1. What does `-d` check in Bash?**

-d checks whether a specified path exists and is a directory. It is commonly used in Bash scripts to validate directory paths before performing operations on them.

---

**2. What does `-f` check in Bash?**

-f checks whether a specified path exists and is a regular file. It is commonly used in Bash scripts to verify that a file is present before reading, copying, or modifying it, helping prevent errors during script execution.

---

**3. Why should file and directory paths be stored in variables?**

Storing file and directory paths in variables makes Bash scripts more flexible, readable, and easier to maintain. If a path changes, you only need to update it in one place instead of searching through the entire script.

---

**4. What happens if the file does not exist?**

If the file does not exist, a Bash file check using -f evaluates to false, and the script executes the else block (if one is provided). This allows the script to handle the situation gracefully instead of failing unexpectedly.

---

# Task 7 — Conditionals: Pass or Retry Script

## Goal

Use if-else conditionals to make decisions based on a variable value.

### Evidence

#### Screenshot 1 — Content of `score-check.sh` with `score=85`

![screenshot_1](screenshots/assignment5-ss15.jpg)

---

#### Screenshot 2 — Output showing `Result: Pass`

![screenshot_2](screenshots/assignment5-ss16.jpg)

---

#### Screenshot 3 — Content of `score-check.sh` with `score=55`

![screenshot_2](screenshots/assignment5-ss17.1.jpg)

---

#### Screenshot 4 — Output showing `Result: Retry`

![screenshot_2](screenshots/assignment5-ss17.jpg)

---

### Notes

Answer the following in your own words:

**1. What is the purpose of if-else in Bash?**

The if-else statement in Bash is used to make decisions by executing different blocks of code based on whether a condition is true or false. It allows scripts to respond to different situations, making them more dynamic and reliable.

---

**2. What does `-ge` mean?**

In Bash, -ge means "greater than or equal to". It is a numeric comparison operator used to check whether one number is greater than or equal to another.

---

**3. Why should conditions be tested with different values?**

Conditions should be tested with different values to ensure the script behaves correctly in all possible scenarios, including both expected and unexpected inputs. This helps identify logic errors, verify that each branch of the condition (if, elif, and else) works as intended, and improves the reliability of the script.

---

**4. How can conditionals help in automation scripts?**

Conditionals help in automation scripts by allowing the script to make decisions based on specific conditions. Instead of always performing the same actions, the script can check the system's state and execute different commands depending on the result.

---

# Task 8 — Functions: Final Bash Automation Script

## Goal

Create a final Bash script using functions to organize reusable code.

### Evidence

#### Screenshot 1 — Content of `final-automation.sh`

![screenshot_1](screenshots/assignment5-ss18.jpg)
![screenshot_1](screenshots/assignment5-ss19.jpg)

---

#### Screenshot 2 — Output of `./final-automation.sh`

![screenshot_2](screenshots/assignment5-ss20.jpg)

---

#### Screenshot 3 — Output of `ls -lah` showing all created scripts

![screenshot_3](screenshots/assignment5-ss21.jpg)

---

### Notes

Answer the following in your own words:

**1. What is a function in Bash?**

A function in Bash is a reusable block of code that performs a specific task. Instead of writing the same commands multiple times, you define them once in a function and call the function whenever you need it.

---

**2. Why are functions useful in scripts?**

Functions are useful in Bash scripts because they let you group reusable code into a single block that can be called whenever needed. This reduces code duplication, improves readability, and makes scripts easier to maintain and update.

---

**3. Which functions did you create in this script?**

I created functions to organize the script into reusable tasks. These included functions such as check_directory() to verify that a directory exists, check_file() to confirm a file is present, and display_message() to print status messages. Each function performed a specific task, making the script more modular, readable, and easier to maintain.

---

**4. How does this final script combine variables, arrays, loops, conditionals, files, and functions?**

The final script combines variables to store data, arrays to manage multiple values, loops to automate repetitive tasks, conditionals to make decisions, file checks to validate resources, and functions to organize reusable code. Together, these features make the script efficient, modular, reliable, and easier to maintain.

---

# LinkedIn Post (Required)

## Evidence

#### LinkedIn Post URL

(https://www.linkedin.com/posts/ugcPost-7485032645484081152-rucZ/?highlightedUpdateUrn=urn%3Ali%3Aactivity%3A7485032646671220736&highlightedUpdateType=SOCIAL_SHARE&origin=SOCIAL_SHARE&utm_source=share&utm_medium=member_desktop&rcm=ACoAAB6VGscB2AplIT7PcrwZvA0ECup4mNaUoIw)


---

#### Screenshot — Published LinkedIn post

![screenshot](screenshots/assignment5-ss22.jpg)

---

# Submission Instructions

- Add all required screenshots in your submission
- Full name must be visible in required screenshots
- All script files must be created and run successfully
- Required notes must be answered clearly for every task
- Do not expose sensitive information (keys, passwords, credentials)

---

# Completion Checklist

- [✅] Task 1: Environment setup verified, workspace created (Screenshots 1–2, Notes answered)
- [✅] Task 2: First script created, executed, permissions verified (Screenshots 1–3, Notes answered)
- [✅] Task 3: Variables script created and run (Screenshots 1–2, Notes answered)
- [✅] Task 4: Arrays and loops script created and run (Screenshots 1–2, Notes answered)
- [✅] Task 5: Counter loop script created and run (Screenshots 1–2, Notes answered)
- [✅] Task 6: File validation script created and run (Screenshots 1–3, Notes answered)
- [✅] Task 7: Pass/Retry conditional script tested with both values (Screenshots 1–4, Notes answered)
- [✅] Task 8: Final automation script created and run (Screenshots 1–3, Notes answered)
- [✅] All scripts run without errors
- [✅] Full Name visible in all required screenshots
- [✅] LinkedIn post published and URL submitted
- [✅] No sensitive data exposed

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