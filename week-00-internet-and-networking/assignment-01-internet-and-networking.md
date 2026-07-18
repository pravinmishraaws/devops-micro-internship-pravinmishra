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

![Assignment 0 Screenshots](screenshots/assgn0-img1.png)




---

## What I Learned (2–3 lines)

I learned that a networking protocol is a set of agreed rules that allows devices to communicate and exchange data correctly. Just like people follow rules during a phone conversation, network devices use protocols such as HTTP to communicate with one another.

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

When a user visits the EpicReads online bookstore from anywhere in the world, the internet uses several technologies to deliver the website quickly and correctly. First, the website hosted in Finland has an IP address, which acts like the website’s digital home address so devices can locate it online. When users request the site, the data is broken into small pieces called packets through a process known as Packet Switching. These packets travel through different internet routes and are reassembled when they reach the user’s device. The communication happens using the TCP/IP protocol suite, which ensures the data is sent accurately and reaches the correct destination. Finally, users access the bookstore through HTTP or the more secure HTTPS protocol, which allows browsers to load web pages safely, especially when customers are making payments or entering personal information.


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

![Assignment 0 Screenshots](screenshots/assgn0-img2.png)






---

## Technologies Used

### Frontend

* HTML/CSS
* React


### Backend

* Node.js
* Django

### Database

* MySQL
* MongoDB

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

1. DNS (Domain Name System) is like the internet’s phonebook. It translates easy-to-remember domain names such as epicreads.com into IP addresses that computers use to locate websites online. Instead of typing 52.172.142.222:3000, users can simply type the domain name in their browser.
2. To connect the domain to the server IP, an A Record should be used because it maps a domain name directly to an IPv4 address. The A Record will point epicreads.com to 52.172.142.222, allowing users worldwide to access the bookstore website easily. 



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

![Assignment 0 Screenshots](screenshots/assgn0-img3.png)



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

https://www.linkedin.com/posts/kingsley-erhatiemwonmon_my-devops-learning-journey-internship-activity-7464656740475764738-kUKp?utm_source=share&utm_medium=member_desktop&rcm=ACoAAClDkSEBa4Zo6dTWVIEEl8FJLczvH_zPHtY


---

## LinkedIn Post Backup Copy

Paste the full text of your LinkedIn post here:

My DevOps Learning Journey – Internship Assignment Summary
As part of my DevOps learning journey, I recently completed several foundational tasks covering networking, internet concepts, application architecture, DNS, and development tools. Here’s a summary of what I learned:
ChatGPT & Networking Basics
I used OpenAI ChatGPT to better understand networking concepts in beginner-friendly terms.
One important concept I learned was network protocols. A protocol is simply a set of rules that devices follow to communicate over a network, just like people follow language rules to understand each other.
For example, when you send a WhatsApp message or open a website, protocols ensure the information is delivered correctly between devices.
Internet & Networking
I learned how the internet delivers websites across the world using technologies such as:
IP Address → The digital address of a server or website
Packet Switching → Data is divided into smaller packets before traveling across the internet
TCP/IP → Ensures data reaches the correct destination accurately
HTTP/HTTPS → Protocols used by browsers to load websites securely
For example, when users visit an online bookstore hosted in Finland, these technologies work together to ensure the website loads correctly and securely from anywhere in the world.
Application Architecture & Stack
Two-Tier Application
Frontend:
HTML/CSS
React
Database:
MySQL
PostgreSQL
Three-Tier Application
Frontend:
HTML/CSS
React
Backend:
Node.js
Django
Database:
MySQL
MongoDB
I also learned that three-tier architecture is more scalable, secure, and easier to maintain because the frontend, backend, and database are separated into different layers.
DNS (Domain Name System)
DNS works like the Internet’s phonebook. It converts domain names such as epicreads.com into IP addresses that computers use to find websites online.
To connect a domain name to a server IP like 52.172.142.222, an A Record is used because it maps a domain directly to an IPv4 address.
Visual Studio Code Setup
I also explored setting up Visual Studio Code for development tasks. VS Code is a powerful and lightweight code editor widely used for programming, debugging, terminal access, and DevOps workflows.
This assignment helped strengthen my understanding of networking, system architecture, and essential DevOps concepts as I continue building my cloud and DevOps skills. 🚀
P.S. This post is part of the FREE DevOps Micro Internship Cohort run by Pravin Mishra. You can start your DevOps journey for free from his YouTube Playlist.

---

# Reflection – Week 0

### What did you find easy?

I found it easy to understand basic networking concepts such as protocols, IP addresses, DNS, and how users access websites. Using ChatGPT as a learning assistant also made it easier to simplify technical concepts and understand them through real-life examples.

---

### What was difficult?

Understanding how the different components of the internet work together was challenging at first, especially packet switching, TCP/IP, and the difference between two-tier and three-tier application architectures. Connecting these concepts to how a real website works required additional learning and practice.

---

### What will you improve next week?

Next week, I will improve my practical skills by spending more time working with technical tools and commands. I will also continue strengthening my understanding of DevOps concepts by connecting theory to real-world applications and practicing what I learn.

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