# 🚀 Assignment Workflow Guide

This guide covers the prerequisite setup required before starting your assignments, along with the complete process for completing and submitting assignments during the DevOps Micro-Internship.

If you have not completed the required setup steps yet, follow this guide carefully and complete all sections in order.

If you have already completed the setup and are familiar with the assignment workflow, you can use this guide as a reference whenever needed.

---

## 1. Go to GitHub Website and Start Sign-In

Open your web browser and go to the official GitHub website:

👉 [https://github.com/](https://github.com/)

Click on the **"Sign in"** button at the top-right corner of the page.

![GitHub Sign In Button](images/ss66.png)

---

## 2. Enter Your Login Details

After clicking sign in, you will be redirected to the login page.

Enter your:

* Username or email address
* Password

Then click **Sign in** to log into your GitHub account.

![GitHub Login Form](images/ss67.png)

---

## 3. Open the DMI Cohort 3 GitHub Repository

Copy and paste the following GitHub repository link into your browser:

[https://github.com/pravinmishraaws/devops-micro-internship-pravinmishra.git](https://github.com/pravinmishraaws/devops-micro-internship-pravinmishra.git)

Press Enter to open the repository page.

You will see the **DMI Cohort 3 GitHub repository** created by Pravin Mishra.

If you have successfully signed in in the previous step, you should see your **profile picture in the top-right corner** of the GitHub page. This confirms that you are logged in correctly.

![GitHub Repository](images/ss68.png)

---

## 4. Fork the Repository

To start working on the assignment, you need to create your own copy of Pravin Mishra's GitHub repository in your GitHub account.

This is done by **forking the repository**, which simply means copying the original repository into your own GitHub account.

Click on the **Fork** button in the top-right corner of the repository page.

![Fork Repository](images/ss69.png)

---

## 5. Create Your Fork

After clicking the Fork button, a setup page will appear.

Keep all options as **default** and click on **Create fork**.

This will create a copy of the repository in your own GitHub account.

![Create Fork](images/ss70.png)

---

## 6. Fork Completed Successfully

🎉 Congratulations!

You have now successfully created a copy of the original repository in your own GitHub account.

Please check the highlighted details in the screenshot below to make sure your fork was created correctly.

![Fork Completed](images/ss71.png)

---

## 7. Click on the Code Button

Go to your forked repository and click on the **Code** button.

![Click Code Button](images/ss72.png)

---

## 8. Select HTTPS and Copy the Link

After clicking the Code button, select the **HTTPS** tab.

Then click on the copy icon to copy the repository link.

![Copy HTTPS Link](images/ss73.png)

---

## 9. Create Your Working Directory (Create a folder where you want to **download (clone) the GitHub repository**.)

1. Create a folder named **DMI** (or any name you prefer) in any preferred location of your local machine.

![Create folder](images/ss74_1.png)

2. Right-click the folder and select **Copy as path**.

![Create folder](images/ss74_2.png)


## 10. Open Git Bash

Open **Git Bash** terminal on your computer.

![Open Git Bash](images/ss74.png)


Run:

 ```bash

 cd "paste_copied_path_here"

```

Example:

```bash

cd "D:\DMI"

```

![folder_path](images/ss75.png)


Verify your location using:

```bash

pwd

```

![folder_verification](images/ss76.png)


---

## 11. Clone the Repository

Now clone your forked repository using the HTTPS link you copied in Step 8:

Before running the command, make sure the GitHub username in the copied link matches your own GitHub username. This ensures you are cloning your personal forked repository, not the original repository.

```bash
git clone <your-repository-link>
```

![Clone](images/ss77.png)

---

## 12. Verify the Cloned Folder

Go to the folder where you ran the `git clone` command.

Check manually in your file explorer (Windows Explorer / Finder) if a new folder with the repository name has appeared.

If you can see the folder, the cloning process is successful.

This folder will contain the exact same files and sub-folders you saw in the GitHub repository.

![Verify Cloned Folder](images/ss78.png)

---

## 13. Navigate to the Cloned Repository

After cloning the repository, follow these steps in Git Bash to enter your project folder:

### Step 1: List available folders

Check the folders inside your current directory:

```bash
ls
```

You should see your cloned repository folder listed.

---

### Step 2: Move into the repository folder

```bash
cd devops-micro-internship-pravinmishra
```

---

### Step 3: Confirm your current location

```bash
pwd
```

This will show your current working directory path, which confirms you are inside the cloned repository.

![Navigate Cloned Folder](images/ss78_1.png)

---

## 14. Configure Git Identity (Global Setup)

Before making any changes, you need to configure your Git identity.

This information will be used to identify the future work you do on git.

Run the following commands in Git Bash:

```bash
git config --global user.name "your_name"
git config --global user.email "your-email_address"
```

![Git Global Confi](images/ss79.png)

---

## 15. Verify Git Configuration

To confirm that your Git identity is set correctly, run:

```bash
git config --global --list
```

You should see your configured username and email displayed in the output.

![Git Config Verification](images/ss80.png)

---

## 🎯 Let's Start the Assignment

To complete your assignment, you need to edit files inside the GitHub repository you cloned to your local machine.

Most of the files you will work with are in **Markdown (.md) format**

One of the easiest ways to edit these files is by using **Visual Studio Code (VS Code)**.

VS Code provides a clean and user-friendly environment where you can view folders, edit files, and manage your project easily.

---

## 💡 Why VS Code?

VS Code is a widely used code editor because it provides everything in one place:

* You can view all project files and folders in a single window
* You can open and edit files easily
* It has an inbuilt terminal, so you don't need to switch between different applications
* You can run Git commands and manage your project directly inside VS Code

---

## ⚙️ Important Clarification

The VS Code terminal is not a different terminal.

It simply uses your system's terminal (Git Bash, PowerShell, or Terminal) inside the VS Code interface.

There is no difference in the files whether you open them in VS Code or outside it — they are the same physical files on your computer.

If you delete, rename, or modify a file in VS Code, the same changes will be reflected in your system folder, and vice versa.

---

## 🚀 Why this is useful

VS Code allows you to:

* Edit files
* Manage folders
* Run terminal commands
* Work on Git and GitHub workflows

All in one single window, which makes development much easier and faster.

---

## 16. Open Project in Visual Studio Code

There are multiple ways to open your project folder in VS Code. You can use any one of the following methods:

---

### 🟢 Method 1: Open using Terminal (Recommended)

Open Git Bash or terminal, navigate to your project folder, and run:

```bash
pwd -> verify you are in the correct folder (view 13-step 3)
code .
```

![Run code .](images/ss81.png)

This will directly open the current folder in Visual Studio Code.

![VS Code opened](images/ss82.png)

---

### 🟢 Method 2: Open from File Explorer

Go to your project folder in your computer.

Right-click on the folder and select:

👉 **Open with Code**

![Open with code](images/ss83.png)

This will open the folder in VS Code.

![VS Code opened](images/ss82.png)

---

### 🟢 Method 3: Open from VS Code Menu

Open Visual Studio Code.

![VS Code opened](images/ss84.png)

Then go to:

👉 **File → Open Folder**

![Open folder](images/ss85.png)

Select your project folder and click **Select Folder**.

![Open folder](images/ss86.png)

This will open the folder in VS Code.

![VS Code opened](images/ss82.png)

---

### 💡 Important Note

All three methods open the **same project folder in VS Code**.
You can use whichever method is easiest for you.

---

## 17. Open the Terminal in VS Code

To run Git commands inside VS Code, open the integrated terminal.

From the top menu, navigate to:

**View → Terminal**

This will open the terminal panel inside VS Code.

![Open Terminal in VS Code](images/ss87.png)

---

## 18. Select Git Bash as Your Terminal

If the terminal does not open as **Git Bash** by default, you can switch to it manually.

In the terminal panel:

1. Click the **dropdown arrow (▼)** next to the **+** icon.

![Click deopdown menu](images/ss89.png)

2. Select **Git Bash** from the list of available terminals.

![git bash select](images/ss90.png)

This will open a new Git Bash terminal inside VS Code.

![Click deopdown menu](images/ss91.png)

---

## 19. Verify You Cloned Your Fork

Before starting the assignment, verify that you cloned your forked repository and not the original repository.

Run the following command:

```bash
git remote -v
```

You should see output similar to this:

```bash
origin  https://github.com/<your-github-username>/devops-micro-internship-pravinmishra.git (fetch)
origin  https://github.com/<your-github-username>/devops-micro-internship-pravinmishra.git (push)
```

Check that the GitHub username in the URL matches your own GitHub username.

If the username matches your account, you have successfully cloned your fork and are ready to continue with the assignment.

![Verify Remote Repository](images/ss92.png)

Close the terminal after you run these commands, it will save the working space.

---

## 🎯 Let's Start Customizing the Repository

### 1. Open the main README.md File

In Visual Studio Code, go to the left-side **Explorer panel**, where you can see all the files and folders of your project.

Locate the **main README.md file (root level file in the project folder)** and click on it to open.

⚠️ Make sure you open the **main README.md file in the root directory**, not any README files inside other folders.

![Open README](images/ss93.png)

This file contains the main information about your project, and this is where you will start customizing your details.

![Open README](images/ss94.png)

---

### 2. Customize the Repository (Add Your Details)

Now you will personalize the repository by updating your own information inside the **README.md** file.

Find the **"About Me"** section and update it with your details.

You should fill in the following information:

* Name
* LinkedIn profile URL
* Location
* Background
* Goal

![Edit README Details](images/ss95.png)

Replace the existing placeholder text with your own details carefully.

![Edit README Details](images/ss96.png)

---

### 3. Preview Your Changes in README.md

After updating your details in the **README.md** file, you can check how your changes look using the preview feature in VS Code.

Click on the **Preview icon** (highlighted) in the top-right corner of the file.

![Preview README](images/ss97.png)

This will open a live preview of your Markdown file, where you can see how your content will appear when displayed on GitHub.

![Preview README](images/ss98.png)

---

### 4. Switch Back to Source File

To go back and continue editing, click on the **Source (Edit) icon** in the same area.

![Back to Source](images/ss99.png)

This will take you back to the raw Markdown (.md) file where you can make changes.

![Back to Source](images/ss100.png)

---

### ⚠️ Important Note

Always review your changes using the preview option after making updates.

This helps you confirm that:

* Your formatting is correct
* Your details are properly displayed
* Nothing is missing or broken

---

### 5. Open the Week 01 Assignment File

In the VS Code Explorer panel, locate the folder named:

**week-01-success-mindset**

![file](images/ss101.png)

Click on the highlighted dropdown to expand the folder.

Inside this folder, you will see the assignment file:

**assignment-01-mindset-os.md**

![expand](images/ss102.png)

Click on the **assignment-01-mindset-os.md** file to open it.

![README](images/ss103.png)

This is the file where you will complete your Week 01 assignment.

> ℹ️ Every week works the same way: your answers always go in the
> `assignment-*.md` files inside the week folder (some weeks have more than
> one). Week folders do not use README.md for answers.

---

### 6. Fill Your Answers

In this assignment, we have already added placeholders for your answers as:

`Add your answer here...`

These placeholders are used across **all questions in the assignment**.

You simply need to:

* Remove the placeholder text
* Replace it with your own answer

Do not keep the placeholder once you have added your response.

---

### 📌 Example (Assignment 5 – Book List)

For example, in the Book List section you will see:

```text
1. Add your answer here...
```

![book list](images/ss104.png)

You should replace it with your own answer like:

```text
1. Atomic Habits – James Clear
```

![README](images/ss105.png)

---

### ⚠️ Important Note

This rule applies to **every question in all the assignments**, not just the book list:

* Always remove "Add your answer here..."
* Always replace it with your own response
* Make sure all sections are fully completed before submission

---

### 7. Add Screenshots / Images

In this assignment, you may need to include screenshots as part of your answers.

Follow these steps to add an image correctly:

---

#### 📁 Step 1: Locate the screenshots folder

Inside the **week-01-success-mindset**, find the folder named:

`screenshots/`

![ss](images/ss106.png)

---

#### 📂 Step 2: Add your image

Go to your **File Explorer (Windows / Finder)** and:

* Add your screenshot/image into the `screenshots` folder (you can move, download, or copy it from any location)

Example: Copy an image file from another folder

![copy file](images/ss107.png)

* Rename the file if needed (example: `week-01-screenshot-01.png`)

Paste the file in the week-01-success-mindsed/screenshots folder

![paste file](images/ss108.png)

---

#### 💻 Step 3: Add image in VS Code (Markdown)

Go to the place in your `.md` file where you want to display the image and add:

```md
![book1](screenshots/week-01-screenshot-01.png)
```

![paste file](images/ss108_1.png)

Verify the image added correctly using preview

![paste file](images/ss108_2.png)

---

#### ❓ Why do we use `[]` and `()` in Markdown?

This is Markdown image syntax:

```md
![alt text](image path)
```

* `[]` → This is the **alt text (image description)**
  It is used to describe the image if it does not load and helps with accessibility.

* `()` → This is the **path of the image file**
  It tells Markdown where the image is located.

---

#### 🗑️ Step 4: Remove `.gitkeep` file

After adding your images, you can delete the `.gitkeep` file from the `screenshots` folder.

![delete gitkeep file](images/ss109.png)

#### 💡 Why was `.gitkeep` there?

Git does not track **empty folders**.

So `.gitkeep` is used only to:

* Keep the folder in the repository
* Ensure the folder structure exists even when empty

Once you add your own images, it is no longer needed.

---

### ⚠️ Important Note

For **this week's assignment**, you do **not** need to add any screenshots.

This section is included to help you understand how screenshots should be added in future assignments when they are required.

When naming screenshot files, avoid using spaces in the file name.

**❌ Examples:**
- Atomic Habits.jpg
- My Screenshot.png

**✅ Use hyphens (`-`) or underscores (`_`) instead:**
- Atomic-Habits.jpg
- Atomic_Habits.jpg
- My-Screenshot.png
- My_Screenshot.png

---

## 📊 Update Weekly Progress Section

After completing your Week 01 assignment, you need to update your progress in the **main README.md file**.

---

### Step 1: Go to Weekly Progress Section

Open the **main README.md file** again and scroll down until you find the section:

`## Weekly Progress`

Inside this section, you will see a table like this:

```
| Week | Topic | Status | Assignment | LinkedIn Post | Blog Post |
```

Locate the row for:

**Week 01 – Success Mindset**

| 01 | Success Mindset | ⬜ Not Started | ⏳ Pending | — | — |

![locate](images/ss110.png)

---

### Step 2: Understand Status Icons

Here are the meaning of the status icons:

**Status:**

* ⬜ Not Started
* 🔄 In Progress
* ✅ Completed

**Assignment:**

* ⏳ Pending
* ✅ Solved

---

### Step 3: Update Your Row

After completing the assignment, update the row like this:

Change:

```
| 01 | Success Mindset | ⬜ Not Started | ⏳ Pending | — | — |
```

To:

```
| 01 | Success Mindset | ✅ Completed | ✅ Solved | — | — |
```

![update](images/ss111.png)

---

### How to Edit It

Simply:

* Find the row in the table
* Replace the icons/text manually
* Save the file

---

### Step 4: Verify Using Preview

After making the changes, click on the **Preview icon** in VS Code.

Check carefully that:

* The table is updated correctly

* The icons are showing properly

* Nothing is broken or misaligned

If everything looks correct in the preview, your update is successful.

![preview](images/ss112.png)

### ⚠️ Important Note

Make sure:

* You only update **your own week row**
* You do NOT change other weeks

---

## 🔗 Add LinkedIn and Blog Links

After updating your assignment and weekly progress status, you also need to add your **LinkedIn post link** and **Blog link** in the Weekly Progress table.

---

### Step 1: Add LinkedIn Post Link

Go to your LinkedIn post you created for that week.

Click on the **three dots (⋯)** in the post.

![post](images/ss113.png)

Select:

👉 **Copy link to post**

![link](images/ss114.png)

Now go back to VS Code and paste this link into the **LinkedIn Post** column in the Weekly Progress table.

![place](images/ss115.png)

![link](images/ss116.png)

---

### 📝 Step 2: Add Blog Link

Go to your blog post.

Copy the **URL/link** of your blog.

![link](images/ss117.png)

Paste it into the **Blog Post** column in the Weekly Progress table.

![link](images/ss118.png)

![link](images/ss119.png)

---

### Step 3: Verify Your Changes

After adding both links:

Click on the **Preview icon** in VS Code.

Check carefully that:

* LinkedIn link is correctly added
* Blog link is correctly added
* Table format is not broken
* Everything is properly aligned

![preview](images/ss120.png)

If everything looks correct in the preview, your update is complete.

---

### ⚠️ Important Note

* Make sure you copy the **correct post links**
* Do not paste incorrect or empty URLs
* Always verify using preview before moving to the next step

---

## 🏅 Update Your Weekly Stack

After completing a week's assignment, you can unlock and display the corresponding badge in your profile.

In the main **README.md** file, locate the section:

```text
Your stack (uncomment each badge as you earn it):
```

![section](images/ss121.png)

You will see badges that are commented out like this:

```md
<!-- [![Week 01 – Mindset](./badges/week-01.svg)](./week-01-success-mindset/) -->
```

---

### Step 1: Uncomment the Badge

To activate the badge, remove:

```md
<!--
```

from the beginning of the line and

```md
-->
```

from the end of the line.

For example, change:

```md
<!-- [![Week 01 – Mindset](./badges/week-01.svg)](./week-01-success-mindset/) -->
```

![uncomment](images/ss123.png)

to:

```md
[![Week 01 – Mindset](./badges/week-01.svg)](./week-01-success-mindset/)
```

![uncomment](images/ss123.png)

---

### Step 2: Verify Using Preview

After removing the comment markers, open the README preview in VS Code.

You should now see the Week 01 badge displayed in the **Your Stack** section.

This confirms that the badge has been enabled successfully.

![Update Weekly Stack](images/ss124.png)

---

### ⚠️ Important Note

Only enable badges for weeks that you have completed.

As you complete more weeks, repeat the same process to grow your stack and showcase your progress.

---

### Optional Repository Customization

To make your README cleaner and more personalized, you can remove the instructional text that was provided as guidance.

Delete `(uncomment each badge as you earn it)`from the following line:

```text
Your stack (uncomment each badge as you earn it):
```

![line to remove](images/ss125.png)

and also remove:

```text
Complete a week → uncomment the badge → watch your stack grow.
```

![line to remove](images/ss126.png)

Those lines are removed now:

![line to remove](images/ss127.png)

These notes were included to explain how the badge system works. Once you understand the process, they are no longer required in your personal repository.

After removing them, use the README preview to verify that the page still displays correctly.

![Preview](images/ss128.png)

---

## 💾 Save Your Changes

After completing all updates in your files, make sure to save everything.

In VS Code, go to:

**File → Save All**

This ensures all your changes across different files are saved properly in your local project.

![Save](images/ss129.png)

---

### ⚠️ Important Note

Always save your files before moving to the next step (like commit and push), otherwise your changes will not be included in Git.

---

## 💾 Final Pre-Push Checks

Before pushing your changes to GitHub, make sure you complete these important checks:

---

### ✅ Step 1: Save All Files

Make sure all your changes are saved in VS Code.

Go to:

**File → Save All**

This ensures nothing is left unsaved before pushing.

---

### 📂 Step 2: Confirm You Are in the Root Folder

Before running Git commands, make sure your terminal is inside the **root project folder**.

Run the following command:

```bash
pwd
```

You should see a path like this:

```
devops-micro-internship-pravinmishra
```

This confirms that you are inside the correct folder:

👉 **devops-micro-internship-pravinmishra (root repository folder)**

If you see a different folder name (like `week-01-success-mindset`), move back to the root folder before continuing.

![PWD](images/ss140.png)

---

### ⚠️ Important Note

Never run Git commands if:

* Files are not saved
* You are not inside the **devops-micro-internship-pravinmishra** root folder

This can lead to missing or incorrect updates in your repository.

---

## 🚀 Push Your Changes

After completing your updates in the files, you need to save and upload your changes to GitHub.

Open the terminal View --> Terminal --> Slect Git Bash

Run the following commands in order:

---

### 📦 Step 1: Stage your changes

```bash
git add .
```

This adds all modified files to Git tracking.

![add](images/ss141.png)

---

### 💬 Step 2: Commit your changes

```bash
git commit -m "Week 01 - Success Mindset assignment completed"
```

![commit](images/ss142.png)

This command saves a snapshot of your changes into Git with a **meaningful message**.

The `-m` flag means **message**, and it allows you to describe what changes you made.

You can update this message depending on the week and task you are working on.

---

### 📝 Example commit messages:

* `Week 02 - Agentic AI assignment completed`
* `Week 03 - Linux & Bash for DevOps assignment completed`
* `Week 04 - Git & GitHub assignment completed`

---

### ⬆️ Step 3: Push to GitHub

```bash
git push origin main
```

![commit](images/ss142_1.png)

This uploads your changes to your GitHub repository.

---

### ⚠️ Important Note

* If prompted, choose **"Sign in with browser"** and log in using your GitHub account

![commit](images/ss143.png)

* Authorize **Git Credential Manager** when the browser opens

![commit](images/ss144.png)

* Provide username and password

* Authentication succeeded

![Succeeded](images/ss145.png)

* Come back to the terminal - push succeeded

![Succeeded](images/ss146.png)

---

## 🎯 Result

After successful push:

* Your changes will appear on GitHub

* Your assignment will be updated online

Navigate to the forked repositry on browser

![Succeeded](images/ss147.png)

Select week-01-success-mindset folder

![Succeeded](images/ss148.png)

Go inside the folder -> Select the assignment-01-mindset-os.md file

![Succeeded](images/ss149.png)

Check if the changes we have done added

![Succeeded](images/ss150.png)

Go to main README.md file

Check if the changes we have done added

![Succeeded](images/ss151.png)

![Succeeded](images/ss152.png)

![Succeeded](images/ss153.png)

To view the full weekly progress table, scroll right from here

![Succeeded](images/ss154.png)

Rest of the weekly progress table

![Succeeded](images/ss155.png)

---

How to get the submission link?

Go back to the main folder

Click on this : devops-micro-internship-pravinmishra

Then click on code button

![Succeeded](images/ss156.png)

Select https link and copy it

![Succeeded](images/ss157.png)

This is your assignment submission link

---

# How to Add Upstream

## Why do we need upstream?

During the internship, new assignments and updates will be added to the original repository. (Pravin Mishra's repository)

Connecting with upstream allows you to bring those updates into your local repository.

---

## Connecting with Upstream

Run:

```bash
git remote add upstream https://github.com/pravinmishraaws/devops-micro-internship-pravinmishra.git
```

---

## Check if the upstream is added

Run:

```bash
git remote -v
```

You should see:

* origin → your fork
* upstream → original repository

---

## Update Your Repo (Every Week)

Before starting a new assignment (Every Saturday after the live session), run these commands:

```bash
git fetch upstream
git merge upstream/main
```

---

## Result

After this:

* Your local files will be updated with the latest changes of the original repository.
