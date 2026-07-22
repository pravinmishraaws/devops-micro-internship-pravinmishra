# Assignment 4 — Deploy EpicReads Portfolio Website via Nginx

Part of the DevOps Micro Internship (DMI) Cohort 3 with Agentic AI

---

## Purpose

In this assignment, you will deploy a static portfolio website on an Ubuntu VM using Nginx. You will download the website template, add your ownership proof in the footer, deploy the files to the Nginx web root, and verify the website is publicly accessible via a browser.

---

# Task 0 — Pre-flight Check

## Goal

Verify the Ubuntu VM and Nginx are ready for deployment.

### Evidence

#### Screenshot 0 — Output of `sudo systemctl status nginx --no-pager` showing Active (running)

![Nginx service status](./screenshots/a4-nginx-status.png)

---

# Task 1 — Get the Website Source Code

## Goal

Download and extract the portfolio website template.

### Evidence

#### Screenshot 1 — Output of `ls -la` showing the `Pravin-Mishra-Portfolio-main` directory with portfolio files

![Portfolio source files](./screenshots/a4-portfolio-files.png)

---

#### Screenshot 2 — Output of `ls -la` inside `Pravin-Mishra-Portfolio-main` showing `index.html`, `style.css`, `images/`, etc.

![Portfolio directory contents](./screenshots/a4-portfolio-ls.png)

---

# Task 2 — Add Ownership Proof (Anti-Copy Change)

## Goal

Update the website footer with your deployment details.

### Evidence

#### Screenshot 3 — Nano editor open with the updated footer showing "Deployed by: Eze Favour", "Group: DMI Cohort 3", "Week: 4", "Date: July 16, 2026"

![Footer update in nano](./screenshots/a4-footer-update.png)

---

# Task 3 — Deploy Website via Nginx

## Goal

Deploy the portfolio website to the Nginx web root.

### Evidence

#### Screenshot 4 — Output of `sudo nginx -t` showing configuration syntax is ok and test is successful

![Nginx configuration test](./screenshots/a4-nginx-t.png)

---

#### Screenshot 5 — Output of `sudo rm -rf /var/www/html/*`, `sudo cp -r * /var/www/html/`, and `ls /var/www/html` showing deployed files

![Deploy portfolio files to web root](./screenshots/a4-deploy-files.png)

---

# Task 4 — Verify Website is Live

## Goal

Verify the deployed website is publicly accessible and the footer contains your details.

### Evidence

#### Screenshot 6 — Output of `curl ifconfig.me` showing the public IP `54.167.8.10`

![Public IP retrieval](./screenshots/a4-public-ip.png)

---

#### Screenshot 7 — Browser showing the live Pravin Mishra Portfolio website at `http://54.167.8.10` with "Deployed by: Eze Favour", "Group: DMI Cohort 3", "Week: 4", "Date: July 16, 2026" in the footer

![Live portfolio website in browser](./screenshots/a4-browser-live.png)

---

# Task 5 — Mini Real DevOps Operational Check

## Goal

Verify the deployed website and Nginx service are healthy.

### Evidence

#### Screenshot 8 — Output of `systemctl is-enabled nginx` showing "enabled"

![Nginx enabled on boot](./screenshots/a4-nginx-enabled.png)

---

#### Screenshot 9 — Output of `curl -I http://localhost` showing HTTP/1.1 200 OK

![Localhost curl 200 OK](./screenshots/a4-curl-localhost.png)

---

# LinkedIn Post (Mandatory)

## Evidence

#### LinkedIn Post URL

Paste your LinkedIn post URL here:

`https://www.linkedin.com/posts/eze-favour-52732752_devops-linux-ubuntu-ugcPost-7483907365629620224-zVDP/`

---

#### Screenshot — Published LinkedIn post showing the live website with your Full Name in the footer

![LinkedIn post](./screenshots/linkedin-post.png)

---

# Submission Instructions

- Add all required screenshots in your submission
- Full name must be visible in required screenshots
- Ownership proof in the footer is mandatory
- Do not expose sensitive information (keys, passwords, account IDs)

---

# Completion Checklist

- [x] Screenshot 0: Nginx service status (active/running)
- [x] Screenshot 1: Portfolio source files downloaded and extracted
- [x] Screenshot 2: Portfolio directory contents verified
- [x] Screenshot 3: Footer updated with Full Name, Group, Week, and Date
- [x] Screenshot 4: Nginx configuration test successful
- [x] Screenshot 5: Website files deployed to /var/www/html
- [x] Screenshot 6: Public IP retrieved
- [x] Screenshot 7: Live portfolio website accessible in browser with footer details
- [x] Screenshot 8: Nginx enabled on boot
- [x] Screenshot 9: Local HTTP response returns 200 OK
- [x] LinkedIn post published and URL submitted
- [x] Full Name visible in all required screenshots
- [x] No sensitive data exposed

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
