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

![React App showing full name](<screenshots/wk3-Deployed app.png>)

---

#### Screenshot 2 — Output of `ip a`

![Ip a command](<screenshots/wk3-Ip a command.png>)

---

#### Screenshot 3 — Output of `sudo ss -tulpen`

![ss tulpen](<screenshots/ss tulpen command.png>)

---

#### Screenshot 4 — Output of `sudo ufw status`

![ufw status](<screenshots/wk3-ufw status.png>)

---

### Notes

Answer the following in your own words:

**1. What proves Nginx is listening on 0.0.0.0:80?**

The output of sudo ss -tulpen shows:

tcp LISTEN 0 511 0.0.0.0:80 .....users:(("nginx",...))

This confirms that the Nginx service is running and listening on port 80 on all network interfaces (0.0.0.0), making it ready to accept incoming HTTP requests.

---

**2. What proves SSH is active on port 22?**

The sudo ss -tulpen output contains:

tcp LISTEN 0 4096 0.0.0.0:22 .....users:(("sshd",...))

This shows that the SSH daemon (sshd) is actively listening on port 22, allowing remote SSH connections to the server.

---

**3. Did you find any unexpected open ports? Explain briefly.**

No. The only open ports were the expected ones:

Port 22 for SSH remote access.
Port 80 for the Nginx web server serving the React application.
Port 53 for the local DNS resolver (systemd-resolved), which is an internal system service.
Port 323 for chronyd, used for time synchronization.

There were no unexpected or suspicious open ports, indicating the server is exposing only the services required for its operation.

---

# Task 2 — Service Health & Systemd Validation (Nginx)

## Goal

Verify that Nginx is properly installed, running, enabled at boot, and safely configured.

### Evidence

#### Screenshot 1 — Output of `systemctl status nginx --no-pager`

![Nginx status again](<screenshots/wk3-Nginx status again.png>)

---

#### Screenshot 2 — Output of `sudo nginx -t`

![Nginx test](<screenshots/wk3-nginx test ok.png>)

---

#### Screenshot 3 — Output of `sudo ss -lptn '( sport = :80 )'`

![ss lptn](<screenshots/wk3-ss lptn sport 80 .png>)

---

### Notes

Answer the following in your own words:

**1. What happens if Nginx fails to restart in production?**

If Nginx fails to restart in production, the web server will stop serving requests, making the application unavailable to users. This can result in downtime until the issue is identified and the Nginx service is successfully restored.

---

**2. What's your basic rollback plan?**

My basic rollback plan would be to first check the status of the Nginx service to identify any errors. If necessary, I would restart and enable the Nginx service, then validate the configuration using sudo nginx -t to ensure there are no syntax errors. Once the configuration passes validation, I would verify that the application is accessible and functioning correctly.

---

# Task 3 — Logs & Request Trace

## Goal

Verify real traffic flow and analyze logs to understand system behavior and errors.

### Evidence

#### Screenshot 1 — Output of `sudo tail -n 30 /var/log/nginx/access.log`

![Access log](<screenshots/wk3-access log 30.png>)

---

#### Screenshot 2 — Output of `sudo tail -n 30 /var/log/nginx/error.log`

![Error log](<screenshots/wk3-error log 30.png>)

---

#### Screenshot 3 — Output of `sudo journalctl -u nginx --no-pager -n 50`

![Journalctl](<screenshots/wk3-journalctl 50.png>)

---

### Notes

Answer the following in your own words:

**1. Were there any errors in the logs?**

- If yes, mention 1–2 example error lines from the logs and explain what each one means in simple terms.
- If no, explain what it means if the error log is empty or shows no recent errors during your check.

Yes, there were a few errors in the logs.

403 Forbidden

directory index of "/var/www/html/" is forbidden

This means Nginx received a request for the home page but could not find or access the index.html file in /var/www/html. As a result, it denied access and returned a 403 Forbidden response. This occurred when I removed the initial root file before I deployed the React build to Nginx web root.

400 Bad Request

"CONNECT check.proxypool.sh:443 HTTP/1.1" 400

This indicates that an external client or bot sent an invalid request to the server. Nginx rejected the request because it was not a valid HTTP request for the web server.

---

**2. If there were no errors, what does that indicate about the system?**

Although a few errors were recorded, the later log entries show that the application was served successfully with 200 OK responses. This indicates that the issues were temporary and that the Nginx service and React application were functioning correctly after they were resolved.

---

**3. Based on the access logs, were your curl requests visible in the log entries? What does that prove about traffic flow?**

Yes, my curl request was visible in the Nginx access log. This proves that the request successfully reached the Nginx web server, was processed, and was logged. It also confirms that the network path between the client and the server is working correctly and that Nginx is handling incoming HTTP traffic as expected.

---

# Task 4 — System Resource Health Check (Capacity Red Flags)

## Goal

Assess server capacity and detect potential performance or failure risks.

### Evidence

#### Screenshot 1 — Output of `uptime`

![Uptime](screenshots/wk3-uptime.png)

---

#### Screenshot 2 — Output of `free -h`

![free -h](<screenshots/wk3-free -h.png>)

---

#### Screenshot 3 — Output of `df -h`

![df -h](<screenshots/wk3-df -h.png>)

---

#### Screenshot 4 — Output of `sudo du -sh /var/* | sort -h`

![du -sh](<screenshots/wk3-du -sh.png>)

---

### Notes

Answer the following in your own words:

**1. Which resource looks most critical right now? (CPU/load, memory, or disk) Explain why.**

The most critical resource right now is memory. Although the server still has about 562 MB of available RAM, it only has 908 MB of total memory and no swap space configured. This means that if memory usage increases significantly, the server has no swap space to fall back on, which could cause applications to slow down or be terminated due to insufficient memory. The CPU load is very low (0.00), and the disk usage is only 60%, so those resources are currently healthy.

---

**2. What happens if disk becomes 100% full in a production server?**

If the disk becomes 100% full, the server may no longer be able to write new files, logs, or temporary data. This can cause applications to fail, prevent users from uploading data, stop services from functioning correctly, and even prevent the system from starting or restarting properly. Keeping enough free disk space is important to ensure the server remains stable and reliable.

---

# Task 5 — Configuration & Deployment Verification

## Goal

Ensure the correct React build is deployed and Nginx is serving it properly.

### Evidence

#### Screenshot 1 — Output of `ls -lah /var/www/html | head -n 20`

![ls -lah](<screenshots/wk3-ls -lah.png>)

---

#### Screenshot 2 — Output of `grep -R "Deployed by" -n /var/www/html 2>/dev/null | head`

![Deployed by](<screenshots/wk3-grep Deployed by.png>)

---

#### Screenshot 3 — Output of `grep -n "try_files" /etc/nginx/sites-available/default`

![Try files](<screenshots/wk3-grep try_flies.png>)

---

### Notes

Answer the following in your own words:

**1. How do you confirm that the correct version of the application is deployed?**

I confirmed that the correct version of the application was deployed by checking the contents of the deployment directory using ls -lah /var/www/html | head -n 20 to verify that the latest build files were present. I then used grep to search for the "Deployed by" marker which showed my name with date and confirmed that the expected application version was deployed. Finally, I ran grep -n "try_files" /etc/nginx/sites-available/default to verify that the Nginx configuration contained the correct try_files directive required to properly serve the React application.

---

# Task 6 — Nginx Configuration Failure Simulation

## Goal

Simulate a real-world Nginx misconfiguration and recover the service safely.

### Evidence

#### Screenshot 1 — Output of `sudo nginx -t` showing the syntax error (broken config)

![Nginx syntax error](<screenshots/wk3-nginx conf test fail.png>)

---

#### Screenshot 2 — Output of `sudo nginx -t` showing syntax ok (fixed config)

![Fixed config](<screenshots/wk3-nginx test success.png>)

---

#### Screenshot 3 — Output of `curl -I http://<public-ip>` confirming recovery (200 OK)

![Curl 200 ok](<screenshots/wk3-curl http 200 ok.png>)

---

### Notes

Answer the following in your own words:

**1. What caused the configuration failure?**

The configuration failure was caused by an intentional syntax error introduced into the Nginx configuration file. Because the configuration was invalid, Nginx failed the configuration test and could not restart the service.

---

**2. How did you fix the issue?**

I restored the correct Nginx configuration by removing the syntax error and reverting to the working configuration. I then validated the configuration using sudo nginx -t to confirm the syntax was correct before restarting the Nginx service. Finally, I verified that the service was running successfully and that the application was accessible.

---

**3. How can you avoid this kind of issue in real production systems?**

To avoid this type of issue in production, I would always back up the current configuration before making changes and validate the configuration with sudo nginx -t before restarting or reloading Nginx. I would also test configuration changes in a staging environment first, use version control to track changes, and follow a change management process so that any issues can be quickly identified and rolled back if necessary.

---

# Task 7 — Web Application Failure Simulation

## Goal

Simulate missing deployment content and recover the application safely.

### Evidence

#### Screenshot 1 — Output of `curl -I http://<public-ip>` showing failure (non-200 response)

![Curl failure](<screenshots/wk3-curl error.png>)

---

#### Screenshot 2 — Output of `curl -I http://<public-ip>` confirming recovery (200 OK)

![Curl success after fix](<screenshots/wk3-curl ok again.png>)

---

### Notes

Answer the following in your own words:

**1. What caused the application to break in this scenario?**

The application broke because the deployed application files were removed from the Nginx web root (/var/www/html). As a result, Nginx could not find the required index.html and other static files needed to serve the React application, making the application inaccessible.

---

**2. How did you fix the issue and restore the application?**

I restored the application by copying the backed-up deployment files back into /var/www/html. After restoring the files, I verified the file permissions and confirmed that the application was accessible again by checking it in the browser and ensuring Nginx was serving the application correctly.

---

**3. What steps would you take to prevent this kind of issue in real production systems?**

To prevent this type of issue in production, I would always back up the current deployment before making changes, automate deployments using a CI/CD pipeline to reduce manual errors, and validate that all required application files are present after deployment. I would also perform post-deployment health checks, monitor the application, and have a rollback plan ready so the previous working version can be restored quickly if a deployment fails.

---

# Task 8 — Security & Reliability Review

## Goal

Review and reflect on the security and reliability practices applied during this assignment.

### Security & Reliability Notes

Answer the following in your own words:

**1. Why is SSH key-based authentication more secure than sharing passwords?**

SSH key-based authentication is more secure because it uses a pair of cryptographic keys instead of a password. Private keys are difficult to guess or brute-force, and they are never transmitted over the network during authentication. This significantly reduces the risk of unauthorized access compared to using shared passwords.

---

**2. Why should only required ports be open on a production server?**

Only the ports required for the application should be open to reduce the server's attack surface. Closing unnecessary ports helps prevent unauthorized access, limits exposure to potential security threats, and makes the server more secure.

---

**3. Why is it important for Nginx to be enabled on boot?**

Enabling Nginx on boot ensures that the web server starts automatically whenever the server is restarted. This helps keep the application available without requiring manual intervention after a reboot or system maintenance.

---

**4. What are the risks of sharing secrets, keys, or credentials publicly?**

Sharing secrets, SSH keys, API keys, or passwords publicly can allow unauthorized users to gain access to servers, applications, or cloud resources. This could lead to data breaches, service disruptions, unauthorized changes, or financial losses if cloud resources are misused.

---

**5. Why should cloud resources be stopped or terminated when they are no longer needed?**

Stopping or terminating unused cloud resources helps reduce unnecessary costs, minimizes security risks by removing unused infrastructure, and ensures resources are available for future use. It also promotes efficient cloud resource management and avoids paying for services that are no longer required.

---

# LinkedIn Post (Required)

## Evidence

#### LinkedIn Post URL

Paste your LinkedIn post URL here:

`https://www.linkedin.com/posts/oluwabunmi-olowoyeye_devops-linux-ubuntu-ugcPost-7482852445560311809-AxKG/?utm_source=share&utm_medium=member_desktop&rcm=ACoAABIxKt4BWOFz-d7RRyAsVUilmny_HuUV_Iw`

---

#### Screenshot — Published LinkedIn post

![Prod drill-Linkedin post](<screenshots/Prod drill linkedin screenshot.png>)

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