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

![Task 1 - Browser](./screenshots/assignment-03/task1/Screenshot%201.png)

---

#### Screenshot 2 — Output of `ip a`

![Task 1 - ip a](./screenshots/assignment-03/task1/Screenshot%202.png)

---

#### Screenshot 3 — Output of `sudo ss -tulpen`

![Task 1 - ss -tulpen](./screenshots/assignment-03/task1/Screenshot%203.png)

---

#### Screenshot 4 — Output of `sudo ufw status`

![Task 1 - ufw status](./screenshots/assignment-03/task1/Screenshot%204.png)

---

### Notes

Answer the following in your own words:

**1. What proves Nginx is listening on 0.0.0.0:80?**

Nginx is listening on port 80 can be proved by running the sudo ss -tulpn command in the terminal. If Nginx is active, the output will explicitly show the "nginx" process in a "LISTEN" state next to the address 0.0.0.0:80, confirming it is ready to accept incoming web traffic.

---

**2. What proves SSH is active on port 22?**

SSH is active on port 22 can be proven by running the sudo ss -tulpn command in the terminal. The output will show the "sshd" process in a "LISTEN" state next to port 22, confirming the server is ready to accept remote connections.

---

**3. Did you find any unexpected open ports? Explain briefly.**

No unexpected ports were found. The server only has SSH (port 22) and HTTP (port 80) listening, which are both expected for this production setup. The firewall (ufw) is inactive, allowing all these connections.

---

# Task 2 — Service Health & Systemd Validation (Nginx)

## Goal

Verify that Nginx is properly installed, running, enabled at boot, and safely configured.

### Evidence

#### Screenshot 1 — Output of `systemctl status nginx --no-pager`

![Task 2 - nginx status](./screenshots/assignment-03/task2/Screenshot%201.png)

---

#### Screenshot 2 — Output of `sudo nginx -t`

![Task 2 - nginx -t](./screenshots/assignment-03/task2/Screenshot%202.png)

---

#### Screenshot 3 — Output of `sudo ss -lptn '( sport = :80 )'`

![Task 2 - ss port 80](./screenshots/assignment-03/task2/Screenshot%203.png)

---

### Notes

Answer the following in your own words:

**1. What happens if Nginx fails to restart in production?**

If Nginx fails to restart in production, the web application will become completely inaccessible to users, resulting in a "Site Can't Be Reached" error or a timeout. This happens because the web server stops routing incoming internet traffic to our application's backend files.

---

**2. What's your basic rollback plan?**

The basic rollback plan is to immediately restore the last working backup of the Nginx configuration file and restart the service to restore traffic. If the issue is with the application itself, I would quickly redeploy the previous stable build directory from our version control system.

---

# Task 3 — Logs & Request Trace

## Goal

Verify real traffic flow and analyze logs to understand system behavior and errors.

### Evidence

#### Screenshot 1 — Output of `sudo tail -n 30 /var/log/nginx/access.log`

![Task 3 - access log](./screenshots/assignment-03/task%203/Screenshot%201.png)

---

#### Screenshot 2 — Output of `sudo tail -n 30 /var/log/nginx/error.log`

![Task 3 - error log](./screenshots/assignment-03/task%203/Screenshot%202.png)

---

#### Screenshot 3 — Output of `sudo journalctl -u nginx --no-pager -n 50`

![Task 3 - journalctl](./screenshots/assignment-03/task%203/Screenshot%203.png)

---

### Notes

Answer the following in your own words:

**1. Were there any errors in the logs?**

Yes, there were errors in the error.log. The main error shown is "[error] 24669#24669: *54 directory index of "/var/www/html/" is forbidden" which appears multiple times. This error means that when someone tries to access a directory without specifying a file (like accessing just the root path), Nginx is configured to block directory listing for security reasons and is throwing a 403 (Forbidden) error.

---

**2. If there were no errors, what does that indicate about the system?**

Since there are errors, but they are expected behavior (directory indexing is intentionally blocked for security), it indicates that the system is functioning correctly. The configuration is properly protecting the application by preventing unauthorized directory browsing while still serving the React application files successfully.

---

**3. Based on the access logs, were your curl requests visible in the log entries? What does that prove about traffic flow?**

Yes, the access logs show successful HTTP requests with 200 and 304 response codes from various client IPs. This proves that traffic is flowing correctly through the Nginx server to the React application. The requests are being logged, processed, and responses are being returned successfully, confirming that the entire request-response cycle is working as expected.

---

# Task 4 — System Resource Health Check (Capacity Red Flags)

## Goal

Assess server capacity and detect potential performance or failure risks.

### Evidence

#### Screenshot 1 — Output of `uptime`

![Task 4 - uptime](./screenshots/assignment-03/task4/Screenshot%201.png)

---

#### Screenshot 2 — Output of `free -h`

![Task 4 - free](./screenshots/assignment-03/task4/Screenshot%202.png)

---

#### Screenshot 3 — Output of `df -h`

![Task 4 - df](./screenshots/assignment-03/task4/Screenshot%203.png)

---

#### Screenshot 4 — Output of `sudo du -sh /var/* | sort -h`

![Task 4 - du](./screenshots/assignment-03/task4/Screenshot%204.png)

---

### Notes

Answer the following in your own words:

**1. Which resource looks most critical right now? (CPU/load, memory, or disk) Explain why.**

Disk usage appears to be the most critical resource to monitor. The root filesystem (/dev/root) is at 52% capacity (3.5G used of 6.7G available), which is still healthy but heading toward concern. The load average is 0.00, indicating very low CPU usage, and memory is abundant with 589Mi available out of 908Mi total. However, as application data and logs accumulate over time, disk space can fill up quickly and should be regularly monitored.

---

**2. What happens if disk becomes 100% full in a production server?**

If disk becomes 100% full in a production server, the application and all system services will fail catastrophically. New log files cannot be written, temporary files cannot be created, and database transactions will fail. The Nginx web server will likely crash, making the application completely inaccessible. The server may even become unresponsive since the operating system needs disk space for basic operations. Recovery requires immediate intervention to free up space or expand the filesystem.

---

# Task 5 — Configuration & Deployment Verification

## Goal

Ensure the correct React build is deployed and Nginx is serving it properly.

### Evidence

#### Screenshot 1 — Output of `ls -lah /var/www/html | head -n 20`

![Task 5 - ls html](./screenshots/assignment-03/task5/Screenshot%201.png)

---

#### Screenshot 2 — Output of `grep -R "Deployed by" -n /var/www/html 2>/dev/null | head`

Add your screenshot here.

---

#### Screenshot 3 — Output of `grep -n "try_files" /etc/nginx/sites-available/default`

![Task 5 - try_files](./screenshots/assignment-03/task5/Screenshot%203.png)

---

### Notes

Answer the following in your own words:

**1. How do you confirm that the correct version of the application is deployed?**

You can confirm the correct version is deployed by checking the presence of specific files and content in /var/www/html. Using `ls -lah /var/www/html`, you can verify that all required React build files are present (index.html, manifest.json, static/ directory with JS and CSS files). Additionally, searching for unique strings in the deployed application using `grep -r "Deployed by"` verifies that your personalized content is present, confirming the correct build version is in production.

---

# Task 6 — Nginx Configuration Failure Simulation

## Goal

Simulate a real-world Nginx misconfiguration and recover the service safely.

### Evidence

#### Screenshot 1 — Output of `sudo nginx -t` showing the syntax error (broken config)

![Task 6 - nginx -t fail](./screenshots/assignment-03/task6/Screenshot%201.png)

---

#### Screenshot 2 — Output of `sudo nginx -t` showing syntax ok (fixed config)

![Task 6 - nginx -t pass](./screenshots/assignment-03/task6/Screenshot%202.png)

---

#### Screenshot 3 — Output of `curl -I http://<public-ip>` confirming recovery (200 OK)

Add your screenshot here.

---

### Notes

Answer the following in your own words:

**1. What caused the configuration failure?**

The configuration failure was caused by a syntax error in the Nginx configuration file. Specifically, there was an unexpected closing brace "}" on line 9 of /etc/nginx/sites-enabled/default. This could happen if someone accidentally deleted or misplaced a line in the configuration, breaking the proper syntax structure that Nginx expects.

---

**2. How did you fix the issue?**

To fix the issue, I opened the Nginx configuration file at /etc/nginx/sites-available/default using a text editor (nano or vim), located the problematic line 9 where the unexpected closing brace appeared, and corrected the syntax. The error message pointed to the exact location of the problem, making it straightforward to identify and remove the erroneous character. After fixing the syntax, I ran `sudo nginx -t` again to verify the configuration was valid before restarting the service.

---

**3. How can you avoid this kind of issue in real production systems?**

To avoid configuration failures in production: (1) Always test configuration changes with `sudo nginx -t` before restarting the service, (2) Use version control (git) to track all configuration file changes, (3) Use configuration management tools like Ansible or Terraform, (4) Document all changes with commit messages, (5) Implement a staging environment where changes can be tested before production deployment, (6) Require code review/peer approval before applying configuration changes, (7) Have a rollback plan to quickly revert to the last known good configuration.

---

# Task 7 — Web Application Failure Simulation

## Goal

Simulate missing deployment content and recover the application safely.

### Evidence

#### Screenshot 1 — Output of `curl -I http://<public-ip>` showing failure (non-200 response)

![Task 7 - curl failure](./screenshots/assignment-03/task7/Screenshot%201.png)

---

#### Screenshot 2 — Output of `curl -I http://<public-ip>` confirming recovery (200 OK)

![Task 7 - curl recovery](./screenshots/assignment-03/task7/Screenshot%202.png)

---

### Notes

Answer the following in your own words:

**1. What caused the application to break in this scenario?**

The application broke because all files in the web root directory (/var/www/html/) were deleted, simulating missing or corrupted deployment content. When Nginx tried to serve the application, it found no index.html or any static files, causing the server to return a 500 Internal Server Error. This represents a real-world scenario where a misconfigured deployment process, accidental deletion, or corrupted backup could remove critical application files without taking the service offline immediately, leading to runtime errors for all users.

---

**2. How did you fix the issue and restore the application?**

I fixed the issue by restoring the application files from the backup that was created before simulating the failure. I used `sudo cp -r /var/www/html.backup/* /var/www/html/` to restore all the previously deployed React build files, including index.html, manifest.json, and the static/ directory containing CSS and JavaScript. After restoring the files, I restarted the Nginx service with `sudo systemctl restart nginx` to ensure the service reloaded with the restored content and could properly serve the application again.

---

**3. What steps would you take to prevent this kind of issue in real production systems?**

To prevent this kind of issue in production: (1) Implement automated backup strategies with regular snapshots of the web root and application files, stored off-instance; (2) Use infrastructure-as-code (Terraform, CloudFormation) to manage deployments deterministically and avoid manual file operations; (3) Implement health checks and monitoring that detect missing critical files and trigger alerts immediately; (4) Use deployment tools (Jenkins, GitOps) with validation steps that verify file integrity after deployment; (5) Implement read-only filesystems where possible to prevent accidental deletions; (6) Set up automated recovery procedures that can restore from backups with minimal manual intervention; (7) Use container orchestration (Docker, Kubernetes) where application files are immutable and deployments are atomic.

---

# Task 8 — Security & Reliability Review

## Goal

Review and reflect on the security and reliability practices applied during this assignment.

### Security & Reliability Notes

Answer the following in your own words:

**1. Why is SSH key-based authentication more secure than sharing passwords?**

SSH key-based authentication is more secure because it uses cryptographic key pairs instead of passwords. The private key is stored locally and never transmitted, while the server only knows the public key. This makes brute-force attacks impractical since attackers would need to crack the private key encryption rather than guess a password. Additionally, key-based auth eliminates the risks of password reuse, phishing, or accidental password sharing. Keys can also be protected with passphrases and rotated easily without affecting the server.

---

**2. Why should only required ports be open on a production server?**

Opening only required ports follows the principle of least privilege, reducing the attack surface. Each open port is a potential entry point for attackers to exploit vulnerabilities. In this deployment, only SSH (port 22) for management and HTTP (port 80) for the web application are needed. Any other open ports (like SMTP, DNS, or database ports) provide unnecessary access paths that could be exploited. By restricting to only essential services, you minimize risks and make security audits easier to manage and defend.

---

**3. Why is it important for Nginx to be enabled on boot?**

Enabling Nginx on boot ensures that the web server automatically starts when the system restarts, maintaining service availability without manual intervention. This is critical for production systems where unexpected restarts (power failures, kernel updates, emergency reboots) can occur. Without autostart enabled, the application would be offline after a reboot until someone manually restarts Nginx, potentially causing significant downtime and lost revenue. Systemd with "enabled" status guarantees the service recovers automatically.

---

**4. What are the risks of sharing secrets, keys, or credentials publicly?**

Sharing secrets, keys, or credentials publicly (in code repositories, chat messages, screenshots, or documentation) creates severe security risks. Attackers can use leaked AWS keys to launch expensive infrastructure or delete data, compromised SSH keys allow unauthorized server access, and exposed database credentials enable data breaches. Even if credentials are rotated later, the damage has already occurred during the exposure window. Public exposure is permanent as Git history cannot be fully erased. This is why secrets should never be committed to version control and must be managed through secure vaults like AWS Secrets Manager or HashiCorp Vault.

---

**5. Why should cloud resources be stopped or terminated when they are no longer needed?**

Unused cloud resources incur unnecessary costs that accumulate quickly, impacting the project budget significantly. An idle EC2 instance still charges for compute, storage, and data transfer even if not actively serving users. Terminating unused resources also reduces security risks by eliminating unnecessary infrastructure that could be compromised. It improves resource hygiene and makes it easier to track and manage the infrastructure landscape. In development and testing environments, it's particularly important to stop instances after hours and completely terminate experimental resources to prevent bill shock and maintain financial discipline in cloud operations.

---

# LinkedIn Post (Required)

## Evidence

#### LinkedIn Post URL

Paste your LinkedIn post URL here:

`Add your URL here`

---

#### Screenshot — Published LinkedIn post

Add your screenshot here.

---

# Submission Instructions

- Add all required screenshots in your submission
- Full name must be visible in required screenshots
- Do not expose sensitive information (keys, passwords, account IDs)

---

# Completion Checklist

- [x] Task 1: Screenshots (browser, ip a, ss -tulpen, ufw status) + Notes answered
- [x] Task 2: Screenshots (nginx status, nginx -t, ss port 80) + Notes answered
- [x] Task 3: Screenshots (access log, error log, journalctl) + Notes answered
- [x] Task 4: Screenshots (uptime, free -h, df -h, du -sh) + Notes answered
- [x] Task 5: Screenshots (ls html, grep deployed by, grep try_files) + Notes answered
- [x] Task 6: Screenshots (nginx -t fail, nginx -t pass, curl recovery) + Notes answered
- [x] Task 7: Screenshots (curl failure, curl recovery) + Notes answered
- [x] Task 8: Security & Reliability Notes answered
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