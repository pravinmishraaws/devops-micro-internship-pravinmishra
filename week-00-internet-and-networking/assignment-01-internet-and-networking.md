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

![Task 1 Screenshot](screenshots/ChatGPt_Response.png)


Replace `task-1-chatgpt.png` with your actual screenshot file name.

---

## What I Learned (2–3 lines)

I learned how to use ChatGPT effectively by writing clear prompts, refining responses through follow-up questions, and applying it to solve problems, learn faster, and improve productivity. I also gained an understanding of networking fundamentals, including how devices communicate, the role of IP addresses and protocols, and how networks enable reliable data exchange across connected systems.

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

If my friend is launching an online bookstore called EpicReads with the website hosted in Finland, and someone from the USA wants to access it, the USA end user’s computer will first use the website’s IP Address, which is like the home address of the server in Finland. The browser then uses the TCP/IP protocol to communicate over the Internet. TCP breaks down data into packets while IP ensures that the packets go correctly to their destination. This is called Routing. This process is called Packet Switching, where packets may take different routes in the Internet before reaching Finland. When they get to Finland, the TCP protocol reassembles the packets. The browser then uses HTTP

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

![Application Architecture Diagram](screenshots/Architecture_video.png)


Replace `task-3-diagram.png` with your actual diagram file name.

---

## Technologies Used

### Frontend

* react.js
* Tailwind CSS

### Backend

* Node.js
* JWT(JSON Web Token)

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

The Domain Name System(DNS) is like the Internet’s phonebook. It’s easier for humans to remember the domain name, which is epicreads.com, but the computer communicates using IP addresses like 52.172.142.222. The Domain Name System translates the Domain name into the correct IP address.

My friend should use the A Record type because it directly connects the Domain name to an IPv4 address, enabling him to reach the server hosting the website by just typing in epicreads.com.

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

![VS Code Setup Screenshot](screenshots/the_VS.png)


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

> **P.S. This post is part of the DevOps Micro Internship (DMI) with Agentic AI — Cohort 3 — by Pravin Mishra. My graded progress is public: https://dmi.pravinmishra.com/s/YOUR-GITHUB-USERNAME.html · Start your DevOps journey: https://dmi.pravinmishra.com/?utm_source=student&utm_medium=ps-linkedin&utm_campaign=cohort3**

---

## LinkedIn Post URL

Paste your LinkedIn post URL here:

```text
https://www.linkedin.com/posts/ayomikunphilip_completed-the-first-assignment-of-the-devops-share-7460002917224353792-2yuH?utm_source=social_share_send&utm_medium=member_desktop_web&rcm=ACoAAF4cLMMBGj_ND3_b5bGU28ywvq8aZAW62fs
```

---

## LinkedIn Post Backup Copy

Paste the full text of your LinkedIn post here:

Completed the first assignment of the DevOps Micro Internship Cohort by Pravin Mishra. 🚀

This assignment focused on foundational DevOps and networking concepts, including:
• Using ChatGPT effectively as a technical learning assistant
• Understanding networking protocols and real-world communication models
• Explaining packet switching, TCP/IP, HTTP/HTTPS, and IP addressing in global web communication
• Comparing two-tier and three-tier application architectures with relevant technologies
• Understanding DNS fundamentals and configuring domain-to-IP mapping using A records
• Setting up and working within the Visual Studio Code development environment

This hands-on assignment strengthened my understanding of core infrastructure and networking concepts that form the foundation of DevOps engineering.
I’m documenting my learning journey publicly while continuously improving my technical knowledge and practical skills in cloud and DevOps technologies.

P.S. This post is part of the DevOps Micro Internship Cohort run by Pravin Mishra. You can start your DevOps journey for free from his YouTube Playlist.
Feedback, insights, and networking opportunities are always welcome! 


---

# Reflection – Week 0

### What did you find easy?

I found the whole concept of Internet and Networking, App architecture and stack as well as Domain and DNS.

---

### What was difficult?

Troubleshooting. And that’s because I don’t have prior knowledge of AWS.

---

### What will you improve next week?

Overall improvement on how I use ChatGPT and how I approach learning.

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