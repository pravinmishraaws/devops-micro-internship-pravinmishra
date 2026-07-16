# Assignment 1 — Your First Agentic Session

## 1. Prerequisites Checklist

Before you begin, ensure you have the following:

* Node.js installed

### Install Node.js

1. Open the official Node.js website:[official site](https://nodejs.org/)

![nodejs](./images/ss18.png)

2. Go to the Download tab.

![download](./images/ss17.png)

3. Navigate to "get a prebuilt Node.js®" section

![download](./images/ss19_1.png)

4. Select your operating system (it is usually selected automatically).

![download](./images/ss19.png)

5. Select your architecture (it is usually selected automatically).

![download](./images/ss20.png)

6. Select the installer. The download will begin automatically.

![download](./images/ss21.png)

7. Go to your Downloads folder and locate the installer.

![download](./images/ss22.png)

8. Double-click the installer to start the installation.

9. In the popup window, click Next.

![download](./images/ss23.png)

10. Accept the terms and click 'Next'

![download](./images/ss24.png)

11. Click 'Next' - Change the destination folder if needed

![download](./images/ss25.png)

12. Click 'Next'

![download](./images/ss26.png)

13. Check the box and click 'Next'

![download](./images/ss27.png)

14. Click 'install' and wait for the installation to complete.

![download](./images/ss28.png)

15. Click on 'Finish'

![download](./images/ss29.png)

16. A terminal window will open. Press any key to continue (for example, K).

![download](./images/ss30.png)

18. If you are using Windows, PowerShell will open with administrator privileges.

![download](./images/ss31.png)

19. The required setup will run automatically. When prompted with "Type Enter to exit", press Enter.

![download](./images/ss32.png)

20. Open your git bash terminal:

![git bash](./images/ss1.png)

21. Run the following command to verify your Node.js installation.

```bash
node --version
```

![node version](./images/ss2.png)

---

* Git installed 

Run 

```bash 
git --version
```

![git version](./images/ss3.png)

### Git installation & setup guide: [git installation](../../onboarding/02-install-git.md)

---

* VS Code installed

Run 

```bash 
code --version
```

![vscode version](./images/ss4.png)

### VS Code installation & setup guide: [VS Code installation](../../onboarding/03-install-vscode-and-github-setup.md)

---

* GitHub account ready

### GitHub account creation & setup guide: [GitHub](../../onboarding/01-create-github-account.md)

---

* Claude Pro subscription or 5$ subscription is active

If any of these are missing, install them before proceeding.

---

## 2. Step-by-Step Solution

---

### Step 1 — Install Claude Code CLI

* Open your terminal and run:

```bash
npm install -g @anthropic-ai/claude-code
```

![vscode version](./images/ss33.png)

If you are installing Claude Code for the first time, your output may look slightly different. That's completely normal. As long as the installation completes successfully and claude --version returns a version number, you're ready to continue.

---

* Verify installation:

```bash
claude --version
```

![claude version](./images/ss5.png)

---

Expected output:

* A version number is displayed (e.g., `1.x.x`)

---

### Step 2 — Start Claude Code and authorize it.

* For the steps below, use the arrow keys to navigate through the available options.

1. Open your terminal and run:

```bash
claude
```

![claude](./images/ss6.png)

You will see a screen similar to the one below. Press Enter.

2. Choose your preferred mode and press Enter.

![claude](./images/ss7.png)

3. Select the appropriate login option based on your subscription plan.(Here, Pro plan is selected, For 5$ setup - Select the second option)

![claude](./images/ss8.png)

3. Your browser will open automatically. If it doesn't, Claude will provide a link that you can copy and paste into your browser.

![claude](./images/ss9.png)

4. If you're prompted to add payment details, complete that step first. Once finished, you'll see the authorization screen below.

![claude](./images/ss10.png)

5. An authentication code will be displayed. Copy it.

![claude](./images/ss11.png)

6. Return to the Claude Code terminal and paste the authentication code.

![claude](./images/ss12.png)

7. You should see a screen similar to the one below.

![claude](./images/ss34.png)

---

### Step 3 — Fork the Starter Repository

1. Login to your GitHub account

![github](./images/ss35.png)

2. Open this link [Click here](https://github.com/pravinmishraaws/Ultimate-Agentic-DevOps-with-Claude-Code)

Output window:

![github](./images/ss36.png)


2. Click on 'Fork' button

![github](./images/ss37.png)

3. Keep the default settings and click on 'Create Fork'

![github](./images/ss38.png)

* Wait for the original repository to be copied to your GitHub account.

4. Verify that the repository has been forked to your GitHub account.

![github](./images/ss39.png)

---

### Step 4 — Clone Your Fork

1. Click on 'code' button

![github](./images/ss40.png)

2. Copy the https link

![github](./images/ss41.png)

3. Open your git bash terminal

![git bash](./images/ss1.png)

4. Navigate to the folder you want to clone the repository (as explained in the onboarding guide), then verify your current location.

```bash
cd <folder name>
pwd
```

![github](./images/ss42.png)

4. Clone the repository by running:

```bash
git clone <copied url>
```

![github](./images/ss43.png)

5. Verify that the repository has been cloned successfully.

```bash
ls
```

![github](./images/ss44.png)

6. Navigate to the cloned repository and verify that you're in the correct folder.

```bash
cd Ultimate-Agentic-DevOps-with-Claude-Code/
pwd
```

![github](./images/ss45.png)

7. Open the folder in VS Code. If this method doesn't work, use one of the alternative methods described in the onboarding guide.[onboarding](../../onboarding/04-assignment-submission-guide.md) folder

```bash
code .
```

![github](./images/ss46.png)

8. Folder opened in VS Code

![github](./images/ss47.png)

9. Remove the .claude folder.

* Select the folder, right-click it, and choose Delete.

![github](./images/ss48.png)

10. Remove the CLAUDE.md file

![github](./images/ss49.png)

11. Remove .github folder

![github](./images/ss49_1.png)

12. Final folder structure after removing the .claude folder, .github folder, and CLAUDE.md.

![github](./images/ss50.png)


### Step 4 — Start Claude Code in Project

1. Open terminal in VS Code

![github](./images/ss51.png)

2. Select `git bash` terminal (Recommended)

![github](./images/ss52.png)

3. Run the following command in the terminal:

```bash
claude
```

* This starts Claude Code in the context of your project.

![github](./images/ss53.png)

4. This option is selected automatically. Press Enter.( You may not see this screen and claude code is directly opened in your terminal)

![github](./images/ss54.png)

5. Claude Code is now running in your terminal. The selected model is Haiku 4.5.

![github](./images/ss55.png)


### Step 5 — Observe Agentic Loop 

#### Run the following prompt in the Claude terminal.

1. Copy and paste the following prompt into the Claude terminal, then press Enter.

```
What files are in this project and what does each one do?
```

![github](./images/ss56.png)

2. If Claude requests permission to run commands, select Yes and press Enter.

![github](./images/ss57.png)

3. After Claude finishes responding,Maximize the terminal, Click on the highlighted line (You may see something slightly similar to this)

![github](./images/ss58.png)

4. You can see the tools it used - your tools can be different from this. 

![github](./images/ss59.png) <br>

![github](./images/ss60.png)

5. Claude's response

![github](./images/ss61.png) <br>

![github](./images/ss62.png)

---

#### Run this second prompt in claude terminal

1. Copy and paste the following prompt into the Claude terminal, then press Enter.

```
How many lines of CSS does this project have?
```

![github](./images/ss63.png)

3. After Claude finishes responding,Maximize the terminal, Click on the highlighted line (You may see something slightly similar to this)

![github](./images/ss64.png)

3. You can see the tools it used - your tools can be different from this. 

![github](./images/ss65.png)

4. Claude's response

![github](./images/ss66.png)

---

## 3. Required screenshots

### Screenshot 1 — Terminal showing `claude --version` with the version number visible

![claude version](./images/ss5.png)

### Screenshot 2 — Claude Code authenticated and showing the terminal prompt 

![claude version](./images/ss34.png)

### Screenshot 3 — VS Code with the project open, file tree visible showing `index.html`, `style.css`, `images/`

![claude version](./images/ss50.png)

### Screenshot 4 — Claude's response to the first question, showing it read the files (tool calls visible)

* Screenshots have splitted and taken as they cannot capture in one screenshot

![claude version](./images/ss59.png) <br>

![github](./images/ss60.png) <br>

![github](./images/ss61.png) <br>

![github](./images/ss62.png) <br>

### Screenshot 5 — Claude's response to the second question, showing it ran a command and reported the line count

![github](./images/ss65.png)

![github](./images/ss66.png)