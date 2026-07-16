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

Add your screenshot here.

---

#### Screenshot 2 — Output of `pwd` and `ls -lah` showing the scripts directory

Add your screenshot here.

---

### Notes

Answer the following in your own words:

**1. What is Bash?**

Bash (Bourne Again SHell) is a Unix shell and command-line interpreter that serves as both an interactive command language and a scripting language. It is the default shell on most Linux distributions, including Ubuntu, and is widely used for system administration, automation, and DevOps tasks. Bash provides features like command history, job control, variables, functions, and scripting capabilities that make it powerful for both interactive use and automation.

---

**2. What is the difference between shell and Bash?**

"Shell" is a generic term for any command-line interface that interprets user commands and executes them — examples include sh (Bourne shell), Bash, Zsh, Fish, and Ksh. Bash is a specific implementation of a shell that extends the original Bourne shell (sh) with additional features like arrays, arithmetic operations, improved scripting capabilities, and better interactive use features. In short, Bash is a type of shell, but not all shells are Bash.

---

**3. Why is it important to confirm the Bash version before writing scripts?**

Confirming the Bash version is important because different versions support different features. For example, associative arrays were introduced in Bash 4.0, and certain syntax like `[[ ]]` for conditionals may behave differently across versions. Knowing the version ensures you write scripts that are compatible with the target environment, avoiding unexpected errors when scripts are run on systems with older or different Bash versions.

---

# Task 2 — Your First Bash Script

## Goal

Create your first Bash script, make it executable, and run it from the terminal.

### Evidence

#### Screenshot 1 — Content of `first-script.sh`

Add your screenshot here.

---

#### Screenshot 2 — Output of `./first-script.sh`

Add your screenshot here.

---

#### Screenshot 3 — Output of `ls -l first-script.sh` showing executable permission

Add your screenshot here.

---

### Notes

Answer the following in your own words:

**1. What is the purpose of `#!/bin/bash`?**

`#!/bin/bash` is called a shebang. It tells the operating system which interpreter to use when executing the script. When the script is run as an executable (e.g., `./script.sh`), the kernel reads the shebang line and invokes `/bin/bash` to interpret the script. Without it, the system would use the default shell, which might not be Bash and could cause syntax errors.

---

**2. Why do we use `chmod +x` before running a script?**

`chmod +x` adds the executable permission to the script file. Without this permission, the file cannot be executed directly as a program — attempting to run `./script.sh` would result in a "Permission denied" error. The `+x` flag makes the file executable for the owner, group, and others, allowing it to be run as a command.

---

**3. What is the difference between running a script using `./script.sh` and `bash script.sh`?**

Running `./script.sh` executes the script directly using the interpreter specified in the shebang line (`#!/bin/bash`), and requires the file to have executable permission. Running `bash script.sh` explicitly invokes Bash as the interpreter and passes the script as an argument — this works even if the file does not have executable permission or if the shebang is missing. The `./script.sh` method is preferred for production scripts because it respects the shebang and is more portable.

---

# Task 3 — Variables: User Information Script

## Goal

Use variables to store and display user-related information.

### Evidence

#### Screenshot 1 — Content of `user-info.sh`

Add your screenshot here.

---

#### Screenshot 2 — Output of `./user-info.sh`

Add your screenshot here.

---

### Notes

Answer the following in your own words:

**1. What is a variable in Bash?**

A variable in Bash is a named storage location that holds a value (string, number, or array). Variables are used to store data that can be referenced and manipulated throughout a script. Unlike strongly typed languages, Bash variables are untyped — they are all treated as strings by default unless declared with specific attributes using `declare`.

---

**2. Why should we avoid spaces around the `=` sign when creating variables?**

In Bash, the `=` sign must have no spaces around it because the shell uses spaces as delimiters to separate commands, options, and arguments. Writing `name = "Favour"` would be interpreted as running the command `name` with arguments `=` and `"Favour"`, which would fail. The correct syntax is `name="Favour"` with no spaces around `=`.

---

**3. How do you access the value stored inside a Bash variable?**

You access the value stored in a Bash variable by prefixing the variable name with a dollar sign `$`. For example, if you have `name="Favour"`, you access it as `$name` or `${name}`. The curly brace syntax `${name}` is useful when the variable name is adjacent to other characters, like `echo "${name}Eze"` to avoid ambiguity.

---

# Task 4 — Arrays & Loops: Tools Checklist Script

## Goal

Use arrays and loops to print a checklist of tools used in Bash scripting.

### Evidence

#### Screenshot 1 — Content of `tools-checklist.sh`

Add your screenshot here.

---

#### Screenshot 2 — Output of `./tools-checklist.sh`

Add your screenshot here.

---

### Notes

Answer the following in your own words:

**1. What is an array in Bash?**

An array in Bash is a data structure that can hold multiple values under a single variable name. Unlike simple variables that store a single value, arrays can store an ordered list of items. Bash supports both indexed arrays (where elements are accessed by numeric index) and associative arrays (where elements are accessed by string keys, available in Bash 4+).

---

**2. Why are arrays useful in scripts?**

Arrays are useful because they allow you to group related data together and process it efficiently using loops. Instead of creating separate variables for each item (e.g., `tool1`, `tool2`, `tool3`), you can store all items in a single array and iterate over them. This makes scripts more maintainable, scalable, and easier to modify when the list of items changes.

---

**3. What does `"${tools[@]}"` mean?**

`"${tools[@]}"` is the syntax to access all elements of an array named `tools`. The `[@]` notation expands to all elements in the array, and the double quotes ensure that each element is treated as a separate word (preserving spaces within elements). This is the standard way to iterate over all array elements in a loop.

---

**4. What is the purpose of the `for` loop in this script?**

The `for` loop iterates over each element in the `tools` array and performs an action for each one — in this case, printing each tool name as part of a checklist. The loop automates the repetitive task of printing each item, making the script concise and easy to update. If a new tool is added to the array, the loop automatically includes it without any code changes.

---

# Task 5 — Loops: Number Counter Script

## Goal

Use loops to repeat a task multiple times.

### Evidence

#### Screenshot 1 — Content of `counter.sh`

Add your screenshot here.

---

#### Screenshot 2 — Output of `./counter.sh`

Add your screenshot here.

---

### Notes

Answer the following in your own words:

**1. What is a loop?**

A loop is a programming construct that repeats a block of code multiple times until a specified condition is met. In Bash, common loop types include `for` loops (iterate over a list of items or a range of numbers) and `while` loops (repeat while a condition is true). Loops are fundamental for automation because they eliminate the need to write repetitive code.

---

**2. Why do we use loops in Bash scripting?**

Loops are used in Bash scripting to automate repetitive tasks without writing the same code multiple times. For example, you might use a loop to process multiple files, check the status of multiple services, generate reports for multiple servers, or iterate through log entries. Loops make scripts shorter, more readable, and easier to maintain.

---

**3. How many times did the loop run in your script?**

In a typical counter script using `for i in {1..5}`, the loop runs 5 times — printing numbers 1 through 5. The exact number depends on the range specified in the script. If using a `while` loop with a counter variable, the loop runs until the counter reaches the specified limit.

---

**4. What would you change if you wanted the loop to run 10 times?**

To make the loop run 10 times, I would change the range in the `for` loop from `{1..5}` to `{1..10}`. Alternatively, I could use a `while` loop with a counter: `count=1; while [ $count -le 10 ]; do ...; ((count++)); done`. The `{1..10}` syntax is the simplest and most readable approach.

---

# Task 6 — Files & Conditionals: File Validation Script

## Goal

Use file checks and conditionals to verify whether files and directories exist.

### Evidence

#### Screenshot 1 — Output of `ls -lah ../test-folder`

Add your screenshot here.

---

#### Screenshot 2 — Content of `file-check.sh`

Add your screenshot here.

---

#### Screenshot 3 — Output of `./file-check.sh`

Add your screenshot here.

---

### Notes

Answer the following in your own words:

**1. What does `-d` check in Bash?**

The `-d` operator in Bash checks whether a given path exists and is a directory. It returns true (exit code 0) if the path is a directory, and false (exit code 1) if the path does not exist or is not a directory. It is commonly used in `if` statements to validate directory paths before performing operations like creating files or changing into the directory.

---

**2. What does `-f` check in Bash?**

The `-f` operator in Bash checks whether a given path exists and is a regular file (not a directory, symlink, or special device file). It returns true if the path is a regular file, and false otherwise. This is useful for verifying that configuration files, log files, or data files exist before attempting to read or process them.

---

**3. Why should file and directory paths be stored in variables?**

Storing file and directory paths in variables makes scripts more maintainable, readable, and reusable. If a path changes, you only need to update the variable assignment rather than searching through the entire script for every occurrence of the path. Variables also allow you to use the same path in multiple places without risk of typos, and make it easier to parameterize scripts for different environments.

---

**4. What happens if the file does not exist?**

If the file does not exist, the `-f` check returns false, and the script can handle this gracefully by printing an error message, creating the file, or taking alternative action. Without the check, attempting to read a non-existent file would result in a "No such file or directory" error, which could cause the script to fail or produce misleading output. Proper file validation prevents these errors.

---

# Task 7 — Conditionals: Pass or Retry Script

## Goal

Use if-else conditionals to make decisions based on a variable value.

### Evidence

#### Screenshot 1 — Content of `score-check.sh` with `score=85`

Add your screenshot here.

---

#### Screenshot 2 — Output showing `Result: Pass`

Add your screenshot here.

---

#### Screenshot 3 — Content of `score-check.sh` with `score=55`

Add your screenshot here.

---

#### Screenshot 4 — Output showing `Result: Retry`

Add your screenshot here.

---

### Notes

Answer the following in your own words:

**1. What is the purpose of if-else in Bash?**

The purpose of if-else in Bash is to make decisions based on conditions. It allows the script to execute different code paths depending on whether a condition is true or false. For example, `if [ $score -ge 70 ]; then echo "Pass"; else echo "Retry"; fi` prints "Pass" if the score is 70 or above, and "Retry" otherwise. This enables scripts to handle different scenarios intelligently.

---

**2. What does `-ge` mean?**

`-ge` stands for "greater than or equal to". It is a numeric comparison operator used in Bash test expressions (`[ ]`). For example, `[ $score -ge 70 ]` checks if the value of `$score` is 70 or higher. Other numeric comparison operators include `-eq` (equal), `-ne` (not equal), `-gt` (greater than), `-lt` (less than), and `-le` (less than or equal to).

---

**3. Why should conditions be tested with different values?**

Testing conditions with different values ensures that all code paths in the conditional logic are working correctly. For example, testing with `score=85` verifies the "Pass" branch, and testing with `score=55` verifies the "Retry" branch. Testing only one value might miss bugs in the other branch, such as incorrect comparison operators or logic errors.

---

**4. How can conditionals help in automation scripts?**

Conditionals enable automation scripts to make intelligent decisions based on real-time conditions. For example, a deployment script can check if a service is running before attempting to restart it, a backup script can check if disk space is sufficient before creating backups, and a monitoring script can send alerts only when thresholds are exceeded. Conditionals make scripts adaptive and robust.

---

# Task 8 — Functions: Final Bash Automation Script

## Goal

Create a final Bash script using functions to organize reusable code.

### Evidence

#### Screenshot 1 — Content of `final-automation.sh`

Add your screenshot here.

---

#### Screenshot 2 — Output of `./final-automation.sh`

Add your screenshot here.

---

#### Screenshot 3 — Output of `ls -lah` showing all created scripts

Add your screenshot here.

---

### Notes

Answer the following in your own words:

**1. What is a function in Bash?**

A function in Bash is a reusable block of code that can be defined once and called multiple times throughout a script. Functions are defined using the syntax `function_name() { ... }` or `function function_name { ... }`. They help organize code into logical, named units that can be invoked by name, making scripts more modular, readable, and maintainable.

---

**2. Why are functions useful in scripts?**

Functions are useful because they: (1) Eliminate code duplication by allowing reuse of common operations, (2) Improve readability by giving descriptive names to blocks of code, (3) Make scripts easier to debug and maintain since changes only need to be made in one place, (4) Enable modular design where each function has a single responsibility, and (5) Allow scripts to be extended easily by adding new functions without disrupting existing code.

---

**3. Which functions did you create in this script?**

In the final automation script, I would create functions such as: `print_header()` to display a formatted title, `check_shell()` to verify the shell environment, `list_tools()` to display the tools checklist using an array and loop, `check_score()` to evaluate a score and print Pass/Retry, `validate_file()` to check if a file or directory exists, and `main()` to orchestrate all the functions in sequence. Each function encapsulates a specific task from the previous scripts.

---

**4. How does this final script combine variables, arrays, loops, conditionals, files, and functions?**

The final script combines all concepts by: using **variables** to store configuration values (name, score, paths), **arrays** to store lists of tools, **loops** to iterate over the array and print each item, **conditionals** to evaluate scores and file existence, **file checks** (`-d`, `-f`) to validate paths, and **functions** to organize each operation into reusable units. The `main()` function calls all other functions in sequence, demonstrating how these building blocks work together in a real automation script.

---

# LinkedIn Post (Required)

## Evidence

#### LinkedIn Post URL

Paste your LinkedIn post URL here:

`__________________________`

---

#### Screenshot — Published LinkedIn post

Add your screenshot here.

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