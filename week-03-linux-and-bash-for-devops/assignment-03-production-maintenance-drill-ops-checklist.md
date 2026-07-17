# Assignment 3 — Production Maintenance Drill (OPS Checklist)

Part of the DevOps Micro Internship (DMI) Cohort 3 with Agentic AI

---

## Purpose

In this assignment, you will treat your already deployed React application (on Ubuntu VM with Nginx) as a live production system. You will perform structured operational checks covering network validation, service health, log analysis, resource monitoring, configuration verification, and incident simulation with recovery — mirroring real on-call DevOps responsibilities.

---

# Task 1 — Server Access & Networking Validation

## Goal

Verify that the deployed React application is reachable from the browser and confirm basic network connectivity of the Ubuntu VM.

### Evidence

#### Screenshot 1 — Browser showing the React app with your Full Name visible on the UI

![react-app-browser](/week-03-linux-and-bash-for-devops/screenshots/react-app-page.png)

---

#### Screenshot 2 — Output of `ip a`

![drill-1](/week-03-linux-and-bash-for-devops/screenshots/drill-01.png)

---

#### Screenshot 3 — Output of `sudo ss -tulpen`

![tulpen](/week-03-linux-and-bash-for-devops/screenshots/tulpen.png)

---

#### Screenshot 4 — Output of `sudo ufw status`

![ufw](/week-03-linux-and-bash-for-devops/screenshots/ufw.png)

---

### Notes

Answer the following in your own words:

**1. What proves Nginx is listening on 0.0.0.0:80?**

Write your answer here.

---

**2. What proves SSH is active on port 22?**

Write your answer here.

---

**3. Did you find any unexpected open ports? Explain briefly.**

Write your answer here.

---

# Task 2 — Service Health & Systemd Validation (Nginx)

## Goal

Verify that Nginx is properly installed, running, enabled at boot, and safely configured.

### Evidence

#### Screenshot 1 — Output of `systemctl status nginx --no-pager`

![drill-06](/week-03-linux-and-bash-for-devops/screenshots/drill06.png)

---

#### Screenshot 2 — Output of `sudo nginx -t`
![drill-07](/week-03-linux-and-bash-for-devops/screenshots/drillo7.png)

---

#### Screenshot 3 — Output of `sudo ss -lptn '( sport = :80 )'`

![listening-port](/week-03-linux-and-bash-for-devops/screenshots/listening-port.png)

---

### Notes

Answer the following in your own words:

**1. What happens if Nginx fails to restart in production?**

If startup fails, Nginx remains down. Users will likely see connection errors or 502/503/504 errors depending on your infrastructure. Although restart failures in production, and its impact depends on how it was restarted and what state it was in before the failure.

---

**2. What's your basic rollback plan?**

1. Verify the issue
   - Check application health, logs, and monitoring to confirm the deployment caused the problem.
2. Roll back to the last known good version
3. Revert any configuration changes that were deployed with the release.
4. Verify the rollback
   - Check that the application is responding correctly.
   - Run tests and monitor logs, error rates, and response times.

---

# Task 3 — Logs & Request Trace

## Goal

Verify real traffic flow and analyze logs to understand system behavior and errors.

### Evidence

#### Screenshot 1 — Output of `sudo tail -n 30 /var/log/nginx/access.log`

![traffic-flow-1](/week-03-linux-and-bash-for-devops/screenshots/traffic-flow-1.png)

---

#### Screenshot 2 — Output of `sudo tail -n 30 /var/log/nginx/error.log`

![traffic-flow-2](/week-03-linux-and-bash-for-devops/screenshots/traffic-flow-2.png)

---

#### Screenshot 3 — Output of `sudo journalctl -u nginx --no-pager -n 50`

![traffic-flow-3](/week-03-linux-and-bash-for-devops/screenshots/traffic-flow-3.png)

---

### Notes

Answer the following in your own words:

**1. Were there any errors in the logs?**

- If yes, mention 1–2 example error lines from the logs and explain what each one means in simple terms.
- If no, explain what it means if the error log is empty or shows no recent errors during your check.

No, there were no errors in the log. What this means is that Nginx successfully reused existing sockets during a reload or restart, which supports graceful restarts without dropping connections.

---

**2. If there were no errors, what does that indicate about the system?**

If there are no errors in the Nginx logs and the service is running normally, it generally indicates that Nginx is healthy. Specifically:
 - Nginx started or reloaded successfully.
 - The configuration is valid (that is why sudo nginx -t also succeeded).
 - Nginx is able to accept incoming connections.
 - The web server itself is not reporting any internal problems.

---

**3. Based on the access logs, were your curl requests visible in the log entries? What does that prove about traffic flow?**

Based on the access logs, curl requests were not visible in the log entries. since the curl request did not appear in the access log, this might be proof that traffic is not flowing from the client to Nginx (and, if the response is successful, likely through to the application if Nginx is acting as a reverse proxy).

---

# Task 4 — System Resource Health Check (Capacity Red Flags)

## Goal

Assess server capacity and detect potential performance or failure risks.

### Evidence

#### Screenshot 1 — Output of `uptime`

![health-check-1](/week-03-linux-and-bash-for-devops/screenshots/health-check-1.png)

---

#### Screenshot 2 — Output of `free -h`

![health-check-2](/week-03-linux-and-bash-for-devops/screenshots/health-check-2.png)

---

#### Screenshot 3 — Output of `df -h`

![health-check-3](/week-03-linux-and-bash-for-devops/screenshots/health-check-3.png)

---

#### Screenshot 4 — Output of `sudo du -sh /var/* | sort -h`

![health-check-4](/week-03-linux-and-bash-for-devops/screenshots/health-check-4.png)

---

### Notes

Answer the following in your own words:

**1. Which resource looks most critical right now? (CPU/load, memory, or disk) Explain why.**

The resource that looks most critical at the moment is memory because the instance has only about 908 MiB of RAM and no swap configured. While around 553 MiB is still available, memory is the most constrained resource and would be the first to become an issue if the workload increased.

---

**2. What happens if disk becomes 100% full in a production server?**

If the disk reaches 100% capacity on a production server, it can cause serious service disruptions because applications and the operating system may no longer be able to write data.

---

# Task 5 — Configuration & Deployment Verification

## Goal

Ensure the correct React build is deployed and Nginx is serving it properly.

### Evidence

#### Screenshot 1 — Output of `ls -lah /var/www/html | head -n 20`

![correct-deploy-1](/week-03-linux-and-bash-for-devops/screenshots/correct-deploy-1.png)

---

#### Screenshot 2 — Output of `grep -R "Deployed by" -n /var/www/html 2>/dev/null | head`

![correct-deploy-2](/week-03-linux-and-bash-for-devops/screenshots/correct-deploy-2.png)

---

#### Screenshot 3 — Output of `grep -n "try_files" /etc/nginx/sites-available/default`

![correct-deploy-3](/week-03-linux-and-bash-for-devops/screenshots/correct-deploy-3.png)

---

### Notes

Answer the following in your own words:

**1. How do you confirm that the correct version of the application is deployed?**

You can confirm that the correct version of the application is deployed using any one of these ways; 
1. Check the deployed application version, If the application provides a version command or endpoint.
2. Verify the deployed code or Git commit, If the application was deployed from Git, compare the commit hash with the intended   
   deployment commit.
3. Check the running service or running process, just to be sure the correct service is running.
4. Check deployment files and timestamps to verify the application files match the expected release date.
5. Review application logs: Check startup logs to confirm the version that was loaded.

---

# Task 6 — Nginx Configuration Failure Simulation

## Goal

Simulate a real-world Nginx misconfiguration and recover the service safely.

### Evidence

#### Screenshot 1 — Output of `sudo nginx -t` showing the syntax error (broken config)

![broken-config](/week-03-linux-and-bash-for-devops/screenshots/broken-config.png)

---

#### Screenshot 2 — Output of `sudo nginx -t` showing syntax ok (fixed config)

![fixed-config](/week-03-linux-and-bash-for-devops/screenshots/fixed-config.png)

---

#### Screenshot 3 — Output of `curl -I http://<public-ip>` confirming recovery (200 OK)

![confirm-recovery](/week-03-linux-and-bash-for-devops/screenshots/confirm-recovery.png)

---

### Notes

Answer the following in your own words:

**1. What caused the configuration failure?**

The configuration failure was caused by an invalid change made to the Nginx configuration file. An unsupported directive was added, which caused **nginx -t** to fail during configuration validation. Because Nginx could not parse the configuration correctly, it was unable to safely apply the changes until the error was corrected.

---

**2. How did you fix the issue?**

Based on the error thrown out by the command **(sudo nginx -t)** that I ran I was able to identify the syntax error and where it is located. I opened the Nginx configuration file, removed the invalid directive and saved the changes. 

---

**3. How can you avoid this kind of issue in real production systems?**

Based on what I have learnt so far in the course of this training and practising with the assignments given, I would avoid this kind of issue in real production systems, running commands that would help me validate all Nginx configuration changes before applying them. 
Secondly, I would use configuration version control, code reviews, and maintain backups of working configurations so changes can be tracked and rolled back easily. I would also use systemctl reload nginx instead of restart after validation, because reload applies changes gracefully and reduces the risk of downtime.


---

# Task 7 — Web Application Failure Simulation

## Goal

Simulate missing deployment content and recover the application safely.

### Evidence

#### Screenshot 1 — Output of `curl -I http://<public-ip>` showing failure (non-200 response)

![non-response](/week-03-linux-and-bash-for-devops/screenshots/non-200-response.png)

---

#### Screenshot 2 — Output of `curl -I http://<public-ip>` confirming recovery (200 OK)

![recovery-200-ok](/week-03-linux-and-bash-for-devops/screenshots/recovery-200-ok.png)

---

### Notes

Answer the following in your own words:

**1. What caused the application to break in this scenario?**

The application broke because the deployed web content was missing or unavailable. The application files required by Nginx to serve the website were removed, moved, or not deployed correctly, causing Nginx to return errors when users requested the application. The web server itself was still running, but it could not find the required application files to deliver the expected response.

---

**2. How did you fix the issue and restore the application?**

I fixed the issue by identifying that the application content was missing from the web root directory. I restored the required application files from the backup/deployment source, verified that the files were present in the correct location, and checked that the permissions were correct.and confirmed that the server returned a successful response (200 OK). This verified that the application was restored and available to users again.


---

**3. What steps would you take to prevent this kind of issue in real production systems?**

To prevent this kind of issue in real production systems do the following;
1. Keep my application code and deployment files under version control so changes can be tracked and rolled back.
2. Use backups and release versions so the previous working application can be restored quickly.
3. Deploy using atomic releases (for example, deploying to a new directory and switching traffic only after validation) to avoid 
   serving incomplete deployments.
4. Test deployments in a staging environment before releasing them to production.
5. Implement health checks and monitoring alerts to detect missing files, failed deployments, or application downtime quickly.
6. Maintain a rollback plan so the service can be restored to the last known good version with minimal downtime.

---

# Task 8 — Security & Reliability Review

## Goal

Review and reflect on the security and reliability practices applied during this assignment.

### Security & Reliability Notes

Answer the following in your own words:

**1. Why is SSH key-based authentication more secure than sharing passwords?**

SSH key-based authentication is more secure because it uses public key cryptography instead of transmitting or storing passwords. The private key remains with the user, while only the public key is stored on the server. This makes brute force attacks much harder, prevents password sharing, and allows administrators to control and revoke access more securely.

---

**2. Why should only required ports be open on a production server?**

Only required ports should be open on a production server to reduce the attack surface and minimize security risks. Each exposed port represents a potential entry point, so restricting access to only necessary services, such as SSH for administration and HTTP/HTTPS for web traffic, helps protect the system from unauthorized access and potential attacks.

---

**3. Why is it important for Nginx to be enabled on boot?**

Nginx should be enabled on boot so that it automatically starts after a server restart or failure recovery. This helps maintain application availability, reduces downtime, and ensures that users can access the application without requiring manual service intervention.

---

**4. What are the risks of sharing secrets, keys, or credentials publicly?**

Secrets, keys, and credentials should never be shared publicly because they can provide direct access to systems and sensitive data. If exposed, attackers may use them for unauthorized access, data theft, or resource abuse. Best practices include storing secrets securely using secret management tools, rotating credentials regularly, using environment variables instead of hardcoding secrets, and immediately revoking any credentials that are accidentally exposed.

---

**5. Why should cloud resources be stopped or terminated when they are no longer needed?**
Cloud resources should be stopped or terminated when they are no longer needed to avoid unnecessary costs and reduce security risks. Removing unused resources helps maintain a cleaner, more manageable infrastructure, prevents forgotten systems from becoming vulnerabilities, and ensures cloud spending is optimized.
---

# LinkedIn Post (Required)

## Evidence

#### LinkedIn Post URL

Paste your LinkedIn post URL here: https://www.linkedin.com/posts/wisgeorge1_devops-cloudengineering-linux-share-7483977181497380864-lnCV/?utm_source=share&utm_medium=member_desktop&rcm=ACoAADp8HhoB_UGFhHiID8Ba-4DVResYfMJJsuY

`__________________________`

---

#### Screenshot — Published LinkedIn post

![production-maintain](/week-03-linux-and-bash-for-devops/screenshots/broken.png)

---

# Submission Instructions

- Add all required screenshots in your submission
- Full name must be visible in required screenshots
- Do not expose sensitive information (keys, passwords, account IDs)

---

# Completion Checklist

- [ ] Task 1: Screenshots (browser, ip a, ss -tulpen, ufw status) + Notes answered
- [ ] Task 2: Screenshots (nginx status, nginx -t, ss port 80) + Notes answered
- [ ] Task 3: Screenshots (access log, error log, journalctl) + Notes answered
- [ ] Task 4: Screenshots (uptime, free -h, df -h, du -sh) + Notes answered
- [ ] Task 5: Screenshots (ls html, grep deployed by, grep try_files) + Notes answered
- [ ] Task 6: Screenshots (nginx -t fail, nginx -t pass, curl recovery) + Notes answered
- [ ] Task 7: Screenshots (curl failure, curl recovery) + Notes answered
- [ ] Task 8: Security & Reliability Notes answered
- [ ] LinkedIn post published and URL submitted
- [ ] Full Name visible in all required screenshots
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