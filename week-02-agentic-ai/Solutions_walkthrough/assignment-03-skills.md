# Assignment 3 — Building Your Command Center

## 1. Prerequisites Checklist

Before you begin, ensure you have the following:

- Assignment 2 completed
- `CLAUDE.md` available in the project root
- Terraform installed (`terraform version` works)
- Claude Code installed and running
- VS Code opened with your project

---

### Install terraform

1. Open the official Terraform installation page

- [Official link](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

2. Scroll down and select `package manager`

3. Choose the package manager accordoing to your OS

![download](./images/ss108.png)

4. For winows OS, select the link for chocolatey.

![download](./images/ss109.png)

5. You will navigate to chocolatey site

![download](./images/ss110.png)

6. Click on install and you'll navigate to this window

![download](./images/ss111.png)

7. Scroll down

8. Open your terminal as administrator
[Reference](https://www.howtogeek.com/194041/how-to-open-the-command-prompt-as-administrator-in-windows-10/)

![download](./images/ss112.png)

9. Run `Get-ExecutionPolicy` and check the output

![download](./images/ss113.png)

* If it returns Restricted, then run `Set-ExecutionPolicy AllSigned` or `Set-ExecutionPolicy Bypass -Scope Process`.

10. Run the following command:

```bash
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

![download](./images/ss114.png)

* You will get a diferent output if you haven't installed chocolatey before.
* If you don't see any errors, you have installed chocolatey successfully.


11. Verify coholatey is installed.

- Run `choco`

* You will get the version of the chocolatey as the output.

![download](./images/ss115.png)


12. Run this command to install terraform using chocolatey

```bash
choco install terraform
```

![download](./images/ss116.png)

* You will get different output if you haven't installed terraform before.


13. Verify the terraform installation

Run
```bash
terraform version
```

* Terraform version will be displayed as teh output of the command.

![download](./images/ss117.png)

---

# 2. Step-by-Step Solution

---

## Step 1 — Create the Skills Folder Structure

1. Open your project in VS Code.

![project](./images/ss118.png)

2. Open the terminal.

![terminal](./images/ss119.png)

3. Run the following commands.

```bash
mkdir -p .claude/skills/scaffold-terraform
mkdir -p .claude/skills/tf-plan
mkdir -p .claude/skills/tf-apply
mkdir -p .claude/skills/deploy
```

![mkdir](./images/ss120.png)

4. Verify that the folder structure has been created successfully.

Your project should now contain:

```

.claude/
└── skills/
├── scaffold-terraform/
├── tf-plan/
├── tf-apply/
└── deploy/

```

* Expand the .claude folder and verify it.

![folder structure](./images/ss121.png)

---

## Step 2 — Add the Skill Files

1. Download all 5 files from the Resources section of [Setup The Skills Files](https://www.udemy.com/course/ultimate-agentic-ai-devops-with-claude-code/learn/lecture/54819705#overview) from Udemy.

- Open the link
- Click on dropdown menu under the resources.

![folder structure](./images/ss122.png)

- Select Download on each file and it will downloaded to your Downloads folder.

![folder structure](./images/ss123.png)

2. Go to the Downloads folder and check if all the files are downloaded.

![folder structure](./images/ss124.png)

3. Copy and paste the downloaded files into their correct locations.

| Downloaded File | Destination |
|-----------------|-------------|
| scaffold-terraform-SKILL.md | `.claude/skills/scaffold-terraform/ |
| scaffold-terraform-template-spec.md | `.claude/skills/scaffold-terraform/template-spec.md` |
| tf-plan-SKILL.md | `.claude/skills/tf-plan/ |
| tf-apply-SKILL.md | `.claude/skills/tf-apply/ |
| deploy-SKILL.md | `.claude/skills/deploy/ |

- Copy files one by one

![folder structure](./images/ss125.png)

- Paste on their destination folder

![folder structure](./images/ss126.png)

![folder structure](./images/ss127.png)

![folder structure](./images/ss128.png)

![folder structure](./images/ss129.png)

![folder structure](./images/ss130.png)

4. Go to the VS Code terminal and verify all the files are copied correctly to their destinations

![folder structure](./images/ss131.png)


5. Rename the files as follows.

| Current file name | Expected file name |
|-----------------|-------------|
| scaffold-terraform-SKILL.md | `SKILL.md` |
| scaffold-terraform-template-spec.md | `template-spec.md` |
| tf-plan-SKILL.md | `SKILL.md` |
| tf-apply-SKILL.md | `SKILL.md` |
| deploy-SKILL.md | `SKILL.md` |

- Select the file, then right click, select `Rename`

![folder structure](./images/ss132.png)

6. Verify the folder structure.

```

.claude/
└── skills/
├── scaffold-terraform/
│ ├── SKILL.md
│ └── template-spec.md
├── tf-plan/
│ └── SKILL.md
├── tf-apply/
│ └── SKILL.md
└── deploy/
└── SKILL.md

```

![skills folder](./images/ss133.png)

7. Open the `tf-plan/SKILL.md` file.

8. Verify the frontmatter contains:

```yaml
allowed-tools: Bash, Read, Grep
disable-model-invocation: true
```

![tf-plan](./images/ss134.png)

---

## Step 3 — Generate Terraform Using the Skill

1. Open Claude Code.

```bash
claude
```

2. Run the following slash command.

```
/scaffold-terraform
```

![command](./images/ss135.png)

3. Claude reads the template specification and begins generating the Terraform files.

4. After completion, Claude displays a summary of the generated files.

The generated files include:

```

terraform/
├── backend.tf
├── main.tf
├── outputs.tf
├── providers.tf
└── variables.tf

```

![summary](./images/ss136.png)


5. Open the `terraform` folder in VS Code and verify that all files were created.

![terraform folder](./images/ss137.png)

---

## Step 4 — Initialize Terraform

1. Open the regular terminal (not Claude Code).

![terraform folder](./images/ss138.png)

2. Navigate into the Terraform directory and verify the location.

```bash
cd terraform
pwd
```

![terraform folder](./images/ss139.png)

3. Initialize Terraform.

```bash
terraform init
```

4. Wait until Terraform finishes initialization successfully.

![init output](./images/ss140.png)

---

## Step 5 — Run the tf-plan Skill

1. Return to the Claude Code terminal.

2. Run the following command.

```
/tf-plan
```

![tf-plan](./images/ss141.png)

3. Claude executes the tf-plan skill, runs terraform plan, and analyzes the output.

4. The output may vary depending on your environment and AWS configuration. The following screenshots are sample outputs. Your output does not need to match these exactly.

**Scenario 1 — AWS credentials are not configured**

If you have not configured AWS credentials in your terminal, Terraform cannot authenticate with AWS.

This is an expected outcome for this assignment.

![tf-plan](./images/ss163.png)

![tf-plan](./images/ss164.png)

**Scenario 2 — AWS credentials are configured**

If AWS credentials are configured correctly and Terraform can communicate with AWS, the plan may succeed.

![tf-plan](./images/ss165.png)

![tf-plan](./images/ss166.png)

---

## Step 6 — Commit and Push Your Changes

1. Go back to a regular terminal where you ran `terraform init`

![reject fix](./images/ss144.png)

2. Navigate to the root folder

```bash
cd ..
```

3. Verify the folder

```bash
pwd
```
![reject fix](./images/ss145.png)

4. Create new file in the root folder named `.gitignore`

5. Open the file in VS Code editor

6. Add .terraform as file content and save the file.

![reject fix](./images/ss149.png)

7. Stage the changes.

```bash
git add .
```

![reject fix](./images/ss147.png)

3. Commit the changes.

```bash
git commit -m "Add Claude skills and Terraform scaffold"
```

![reject fix](./images/ss148.png)

4. Push the changes.

```bash
git push origin main
```

> If your default branch is `master`, replace `main` with `master`.

![git push](./images/ss151.png)

5. Open your GitHub repository and verify the new files are available.

![github](./images/ss150.png)

![github](./images/ss152.png)
---

## Troubleshooting — GitHub Push Failed Due to Large Terraform Files

If you see an error like:

```
File terraform/.terraform/providers/...terraform-provider-aws.exe is larger than 100 MB
```

- this means Terraform provider files were already added to Git tracking before `.gitignore` was created.
- To remove these files from Git tracking (without deleting them from your computer), run:

```bash

git rm -r --cached terraform/.terraform

```

- Then stage and commit the changes:

```bash

git add .
git commit -m "Remove Terraform generated files"
git push origin main

```
-The `.terraform/` folder will remain on your local machine, but Git will no longer track it.

---

# 3. Required Screenshots

---

### Screenshot 1 — VS Code sidebar showing `.claude/skills/` with all four skill folders

![ss1](./images/ss131.png)

---

### Screenshot 2 — `.claude/skills/scaffold-terraform/` showing `SKILL.md` and `template-spec.md`

![ss2](./images/ss153.png)

---

### Screenshot 3 — `tf-plan/SKILL.md` frontmatter showing:

- `allowed-tools: Bash, Read, Grep`
- `disable-model-invocation: true`

![ss3](./images/ss154.png)

---

### Screenshot 4 — Claude's response after running `/scaffold-terraform` showing the generated file summary

![summary](./images/ss136.png)

---

### Screenshot 5 — VS Code sidebar showing the generated `terraform/` folder and all Terraform files

![ss5](./images/ss137.png)

---

### Screenshot 6 — Claude's `/tf-plan` response showing Terraform output and Claude's analysis

- Sample outputs added here.

![analysis](./images/ss163.png)


![analysis](./images/ss164.png)

---

![analysis](./images/ss165.png)


![analysis](./images/ss166.png)


