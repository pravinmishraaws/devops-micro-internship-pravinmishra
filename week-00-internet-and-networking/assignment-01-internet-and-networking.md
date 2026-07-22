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

Prompt: I'm refreshing my DevOps Concepts. Help me with clear explanations like I am starting from scratch. I am planning to join a DevOps course which can help me to achieve my goal. Keeping this in mind , answer my queries with relevant examples and details. I am technical; so I can use technical terminologies at a basic level. Now help me with the query : What is a protocol in networking? Explain with a simple real-life example
 

![Task 1 Screenshot](screenshots/task-1-chatgpt.png)

---

## What I Learned (2–3 lines)

ChatGPT helped me understand that protocols are standardized rules enabling communication between systems, much like real-world protocols (e.g., mail delivery systems). I learned that detailed, context-specific prompts significantly improve the quality and relevance of AI-generated explanations. This approach of providing clear expectations and background will be valuable when I encounter technical concepts throughout my DevOps learning journey.

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

When people around the world visit the EpicReads website hosted in Finland, their devices connect through the internet using TCP/IP, a set of communication rules that allows computers to exchange data. Every device and website has a unique IP Address, similar to a home address, which the Internet Protocol (IP) uses to identify devices and route information to the correct destination across the internet. When a user opens the website, the browser sends an HTTP request, or HTTPS for a secure connection, to the EpicReads server. The data travels using packet switching, where information is divided into small packets that move through different network routes before being reassembled. TCP ensures the packets arrive correctly and in order, while HTTPS encrypts sensitive information like passwords and payment details to keep user data secure.

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

![Application Architecture Diagram](screenshots/task-3-diagram.png)

---

## Technologies Used

### Frontend

* React, Vue, Angular
* HTML5, CSS3, JavaScript

### Backend

* Node.js, Python (Flask/Django), Java (Spring Boot)
* REST APIs, GraphQL

### Database

* PostgreSQL, MySQL
* MongoDB, DynamoDB

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

The Domain Name System (DNS) works like the internet’s phonebook. Instead of remembering an IP address like 52.172.142.222:3000, users can simply type epicreads.com in their browser. DNS translates the domain name into the server’s IP address so the browser can find the correct website. To connect the domain to the server, an A Record should be used because it maps a domain name directly to an IPv4 address. This allows users worldwide to access EpicReads using an easy-to-remember website name instead of a numeric IP address.

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

![VS Code Setup Screenshot](screenshots/task-5-vscode.png)

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

[Linked In Post](https://www.linkedin.com/posts/maneetta-antony_pravin-mishra-the-cloudadvisory-linkedin-activity-7462191694030077954-Kqd5?utm_source=share&utm_medium=member_desktop&rcm=ACoAAF86Sz4BPT7sueDLOfQEmLqLbCo5V7ah-Jo)

---

## LinkedIn Post Backup Copy
As part of preparing to refresh and strengthen my DevOps fundamentals, I recently revisited several core technology concepts that continue to be highly relevant in modern software and infrastructure environments.
🔹 ChatGPT — Understanding how AI-powered conversational systems support technical problem-solving and information retrieval.
🔹 Internet & Networking — Reviewing IP addresses, protocols, and client-server communication fundamentals.
🔹 App Architecture — Revisiting how frontend applications, backend services, APIs, and databases interact within modern systems.
🔹 DNS — Refreshing concepts around domain-to-IP resolution and DNS records such as A Records.
🔹 VS Code Setup — Re-exploring development environment configuration, extensions, and terminal integration.
Technology evolves rapidly, but strong fundamentals remain essential. Revisiting these concepts has been a valuable step in preparing for the next phase of my DevOps learning journey.
P.S. This post is part of the DevOps Micro Internship Cohort run by Pravin Mishra [https://lnkd.in/e3knf-G8]. You can start your DevOps journey from his YouTube Playlist [https://lnkd.in/e6_Yaieq]
#DevOps #Networking #DNS #SoftwareArchitecture #VSCode #ContinuousLearning #DMI


---

# Reflection – Week 0

### What did you find easy?

Understanding the fundamental concepts of internet and networking, particularly how DNS works as a translation mechanism between domain names and IP addresses. The concept of packet switching was also straightforward once I connected it to real-world delivery systems.

---

### What was difficult?

The initial understanding of TCP/IP protocols and the three-tier application architecture required deeper focus. Distinguishing between different application layers and their specific responsibilities took some thought, but the explanation in Task 2 helped clarify the data flow.

---

### What will you improve next week?

I want to deepen my understanding of security protocols (HTTPS/SSL) and how encryption works at the protocol level. Additionally, I'd like to explore more about load balancing and scalability in the context of application architecture.

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