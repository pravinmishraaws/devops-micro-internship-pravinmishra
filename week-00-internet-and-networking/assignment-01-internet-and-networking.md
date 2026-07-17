# Week 00 - Internet and Networking

Part of the DevOps Micro Internship (DMI) Cohort 3 with Agentic AI

---

# 🧑‍💻 Task 1: Using ChatGPT as Your Learning Assistant

## Scenario

You're new to DevOps and will frequently encounter technical questions. ChatGPT can be your learning companion.

## Your Task

Write a clear ChatGPT prompt to help you understand:

> "What is a protocol in networking? Explain with a simple real-life example."

Take a screenshot of your interaction showing:

* Your detailed prompt (with clear expectations)
* ChatGPT's simplified response with an example

## Screenshot

Save your screenshot in the `screenshots` folder and update the file name below.

![Task 1 Screenshot](screenshots/SS1.png)


Replace `task-1-chatgpt.png` with your actual screenshot file name.

---

## What I Learned (2–3 lines)

I learned that ChatGPT can act as a quick learning companion by simplifying technical concepts into easy-to-understand explanations and real-life examples. It helps make complex topics like networking more approachable. 

---

# 🌐 Task 2: Internet and Networking

## Scenario

Your friend is launching an online bookstore named **EpicReads**.

He asked you to explain how users globally can access his website hosted in Finland.

## Your Task

Write a short explanation (**100–150 words**) that includes:

* Packet Switching
* IP Address
* TCP/IP
* HTTP/HTTPS

💡 **Tip:** You may use ChatGPT (as demonstrated in Task 1) to refine your explanation.

## Answer

Websites can be accessed globally because of several important networking technologies. When a user visits a website, their device uses an IP address to locate a server hosted, for example, in Finland. The Internet uses packet switching, where website data is divided into small packets and sent through different network paths before being reassembled on the user’s device. Communication between devices occurs through the TCP/IP protocol suite. TCP ensures that data arrives completely and in the correct order, while IP handles the addressing and routing of packets across networks worldwide. Users access the bookstore through HTTP or HTTPS protocols using their web browser. HTTPS is especially important because it encrypts customer information such as login details and payment data, thereby making online transactions more secure. 


---

# 🏗️ Task 3: Application Architecture & Stack

## Scenario

EpicReads bookstore has two application versions:

### Two-Tier Application

* Frontend
* Database

### Three-Tier Application

* Frontend
* Backend
* Database

## Your Task

* Draw simple diagrams (hand-drawn or tool-based such as draw.io)
* Label each layer clearly
* List at least two common technologies or tools used for each layer
* Submit a screenshot or photo clearly showing your own drawing

## Diagram Screenshot / Photo

Save your diagram image in the `screenshots` folder and update the file name below.

![Application Architecture Diagram](screenshots/SS2.png)



Replace `task-3-diagram.png` with your actual diagram file name.

---

## Technologies Used

### Frontend

* HTML
* React

### Backend

* Node.js
* Python

### Database

* MySQL
* PostgreSQL

---

# 🌍 Task 4: Domain Name & DNS (Basic Concepts)

## Scenario

Your friend's bookstore **EpicReads** is currently accessible through:

```text
52.172.142.222:3000
```

He purchased the domain:

```text
epicreads.com
```

## Your Task

In **50–100 words**, explain in your own words:

1. What is DNS (Domain Name System)?
2. Which DNS record type should be used to connect the domain to the given IP, and why?

## Answer

DNS (Domain Name System) is essentially the internet's phonebook. It translates human-friendly domain names like epicreads.com into machine-readable IP addresses like 52.172.142.222. Without DNS, users would have to memorize numeric IPs to visit websites — DNS makes navigation seamless and user-friendly. 

Which DNS Record Type? Use an A Record. An A (Address) Record maps a domain name directly to an IPv4 address, which is exactly what 52.172.142.222 is. 

---

# 💻 Task 5: Visual Studio Code Setup (Hands-on)

## Your Task

Install Visual Studio Code (if not already installed).

Take a screenshot of your VS Code environment showing:

* Terminal open inside VS Code
* Running a basic command:

### Windows

```powershell
dir
```

### Linux / macOS

```bash
pwd
ls
```

* Your selected VS Code theme clearly visible

⚠️ **Important:** The screenshot must show your username or another identifiable detail to confirm it is your environment.

## Screenshot

Save your screenshot in the `screenshots` folder and update the file name below.

![VS Code Setup Screenshot](screenshots/SS3.png)


Replace `task-5-vscode.png` with your actual screenshot file name.

---

# 🔗 Task 6: Publish Your Assignment as a LinkedIn Post

## Objective

Publishing on LinkedIn helps you:

* Build your professional online presence
* Reinforce your learning
* Document your DevOps journey publicly

## Your Task

Summarize your answers from Tasks 1–5 into a LinkedIn post.

Clearly structure your post into the following sections:

* ChatGPT
* Internet & Networking
* App Architecture
* DNS
* VS Code Setup

Add the following credit note at the end of your post:

> **P.S. This post is a part of DevOps Micro Internship with Agentic AI Cohort-3 by Pravin Mishra. You can start your DevOps journey by joining this Discord community: https://discord.pravinmishra.com/**

---

## LinkedIn Post URL

Paste your LinkedIn post URL here:

```
https://www.linkedin.com/posts/ronnie-santos-131856184_i-recently-completed-the-first-5-tasks-of-activity-7462885253028843520-KKvK?utm_source=share&utm_medium=member_desktop&rcm=ACoAACuNXjUByrzjuiXUdcAXl7CkJp7IYHpF-S8
```

---

## LinkedIn Post Backup Copy

Paste the full text of your LinkedIn post here:

I recently completed the first 5 tasks of the DevOps Micro Internship, and I want to share what I picked up. This is my public accountability post!

Task 1- Using ChatGPT as my AI assistant 
I learned that it can act as a quick learning companion by simplifying technical concepts into easy-to-understand explanations and real-life examples. It helps make complex topics like networking more approachable.

Task 2 - Internet & Networking 
Websites can be accessed globally because of several important networking technologies. When a user visits a website, their device uses an IP address to locate a server hosted, for example, in Finland. The Internet uses packet switching, where website data is divided into small packets and sent through different network paths before being reassembled on the user’s device. Communication between devices occurs through the TCP/IP protocol suite. TCP ensures that data arrives completely and in the correct order, while IP handles the addressing and routing of packets across networks worldwide. Users access the bookstore through HTTP or HTTPS protocols using their web browser. HTTPS is especially important because it encrypts customer information such as login details and payment data, thereby making online transactions more secure.

Task 3 - Application Architecture & Stack 
This task introduced me to the structure of modern applications, the layers involved (frontend, backend, and database), and the ways in which these components interact.

Task 4 - Domain Name & DNS (Basic Concepts 
DNS (Domain Name System) is a like a phonebook of the internet. You can point the domain name to specific IP address using A record.

Task 5 - Visual Studio Code Setup (Hands-on) 
Got my local development environment up and running, practiced some Linux commands via editor terminal


P.S. This post is part of the FREE DevOps Micro Internship Cohort run by Pravin Mishra. You can start your DevOps journey for free from his YouTube Playlist. 


---

# Reflection – Week 0

### What did you find easy?

Networking as i have a hands on background in supporting network infrastructure.

---

### What was difficult?

Understanding application architecture was the most challenging because I come from an IT infrastructure background rather than software development. I also found it difficult to become familiar with the different technologies used in each layer.

---

### What will you improve next week?

I will spend more time learning about the different application tech stacks, especially the frontend, backend, and database technologies, to better understand how modern applications are built and work together.

---

## 📌 About DMI & CloudAdvisory

DevOps Micro Internship (DMI) is a project-based DevOps program run by Pravin Mishra (The CloudAdvisory) focused on real-world execution, systems thinking, and career readiness.

It helps learners build strong DevOps foundations with hands-on experience.


## 📌 Resources

- 🌐 **DMI Official Website:** https://pravinmishra.com/dmi  
- 🎓 **DevOps for Beginners (Udemy):** https://www.udemy.com/course/devops-for-beginners-docker-k8s-cloud-cicd-4-projects/  
- 🎓 **Ultimate Agentic AI DevOps with Clude Code** https://www.udemy.com/course/ultimate-agentic-ai-devops-with-claude-code/?referralCode=448389767BC96284087B
- 🎓 **DevOps with Claude Code: Terraform, EKS, ArgoCD & Helm** https://www.udemy.com/course/devops-with-claude-code-terraform-eks-argocd-helm/?referralCode=1C5B734505D65A010FA3
- ▶️ **YouTube Playlist (DMI Cohort 3):** https://www.youtube.com/playlist?list=PLFeSNDtI4Cho  
- 🔗 **Pravin Mishra (LinkedIn):** https://www.linkedin.com/in/pravin-mishra-aws-trainer/  
- 🏢 **CloudAdvisory (LinkedIn):** https://www.linkedin.com/company/thecloudadvisory/

---

*This submission is part of DevOps Micro Internship (DMI) Cohort 3 — Agentic AI Track*