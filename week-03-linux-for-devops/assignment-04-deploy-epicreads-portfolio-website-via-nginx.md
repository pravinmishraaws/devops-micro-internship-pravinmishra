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

![Nginx service status](./screenshots/a3-nginx-status-final.png)

---

# Task 1 — Get the Website Source Code

## Goal

Download and extract the portfolio website template.

### Evidence

#### Screenshot 1 — Output of `npm run build` and `ls` showing the built project files

![Built project files](./screenshots/build-output.png)

---

# Task 2 — Add Ownership Proof (Anti-Copy Change)

## Goal

Update the website footer with your deployment details.

### Evidence

#### Screenshot 2 — Nano editor open with the updated footer showing your Full Name, Group, Week, and Date

![Footer update in nano](./screenshots/appjs-editor.png)

---

# Task 3 — Deploy Website via Nginx

## Goal

Deploy the portfolio website to the Nginx web root.

### Evidence

#### Screenshot 3 — Output of `cat /etc/nginx/sites-available/default` showing the Nginx configuration

![Nginx configuration](./screenshots/nginx-config-check.png)

---

#### Screenshot 4 — Output of `npm run build` showing the production build process

![Production build process](./screenshots/deploy-www-html.png)

---

# Task 4 — Verify Website is Live

## Goal

Verify the deployed website is publicly accessible and the footer contains your details.

### Evidence

#### Screenshot 5 — Output of `cat /etc/nginx/sites-available/default` showing the Nginx configuration and `curl ifconfig.me` showing the public IP

![Nginx configuration and public IP](./screenshots/curl-public-ip.png)

---

#### Screenshot 6 — Browser showing the live React app at `http://54.167.8.10` with Full Name (Eze Favour) and deployment details in the footer

![Live React app in browser](./screenshots/browser-live.png)

---

# Task 5 — Mini Real DevOps Operational Check

## Goal

Verify the deployed website and Nginx service are healthy.

### Evidence

#### Screenshot 7 — Browser showing the deployed React app at `http://54.167.8.10` with Full Name (Eze Favour) and deployment details visible

![Live React app in browser](./screenshots/nginx-service.png)

---

#### Screenshot 8 — Output of `sudo apt install nginx -y` and `systemctl status nginx` showing Nginx installed and active (running)

![Nginx installation and status](./screenshots/nginx-status.png)

---

# LinkedIn Post (Mandatory)

## Evidence

#### LinkedIn Post URL

Paste your LinkedIn post URL here:

`__________________________`

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
- [x] Screenshot 1: Website files downloaded and extracted
- [x] Screenshot 2: Footer updated with Full Name, Group, Week, and Date
- [x] Screenshot 3: Nginx configuration test successful
- [x] Screenshot 4: Website files deployed to /var/www/html
- [x] Screenshot 5: Public IP retrieved
- [x] Screenshot 6: Live website accessible in browser with footer details
- [x] Screenshot 7: Nginx enabled on boot
- [x] Screenshot 8: Local HTTP response returns 200 OK
- [ ] LinkedIn post published and URL submitted
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