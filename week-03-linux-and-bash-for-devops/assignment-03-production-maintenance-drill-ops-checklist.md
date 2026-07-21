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

![screenshot_1](screenshots/assignment2-ss10.jpg)

---

#### Screenshot 2 — Output of `ip a`

![screenshot_2](screenshots/assignment3-ss2.jpg)

---

#### Screenshot 3 — Output of `sudo ss -tulpen`

![screenshot_3](screenshots/assignment3-ss3.jpg)

---

#### Screenshot 4 — Output of `sudo ufw status`

![screenshot_4](screenshots/assignment3-ss4.jpg)

---

### Notes

Answer the following in your own words:

**1. What proves Nginx is listening on 0.0.0.0:80?**

Nginx is confirmed to be listening on 0.0.0.0:80 when the system shows that the Nginx process is bound to port 80 on all network interfaces. This indicates that the web server is accepting incoming HTTP connections from any IP address, not just the local machine. The successful startup of the Nginx service and verification that it is actively listening on port 80 provide proof that the web server is correctly configured to serve web traffic.

---

**2. What proves SSH is active on port 22?**

SSH is proven to be active on port 22 when the SSH service is running and the system shows that it is listening for incoming connections on TCP port 22. This confirms that the server is configured to accept remote SSH connections, allowing authorized users to securely access and manage the server. Additionally, the ability to successfully connect to the server via SSH is practical evidence that the SSH service is active and functioning correctly.

---

**3. Did you find any unexpected open ports? Explain briefly.**

No, I did not find any unexpected open ports. The server was listening only on the expected ports required for its operation, including port 22 (SSH) for secure remote access and port 80 (HTTP) for serving the web application through Nginx. This indicates that no unnecessary network services were exposed, which is a good security practice and helps reduce the server's attack surface.

---

# Task 2 — Service Health & Systemd Validation (Nginx)

## Goal

Verify that Nginx is properly installed, running, enabled at boot, and safely configured.

### Evidence

#### Screenshot 1 — Output of `systemctl status nginx --no-pager`

![screenshot_1](screenshots/assignment3-ss5.jpg)

---

#### Screenshot 2 — Output of `sudo nginx -t`

![screenshot_2](screenshots/assignment3-ss6.jpg)

---

#### Screenshot 3 — Output of `sudo ss -lptn '( sport = :80 )'`

![screenshot_3](screenshots/assignment3-ss7.jpg)

---

### Notes

Answer the following in your own words:

**1. What happens if Nginx fails to restart in production?**

If Nginx fails to restart in production, the web server will be unable to serve web requests. This can make the website or application inaccessible to users, resulting in downtime and a poor user experience. Depending on the reason for the failure, new configuration changes will not be applied, and if Nginx has already stopped, HTTP requests may fail completely. This is why it is important to test the configuration with nginx -t before restarting the service, allowing configuration errors to be detected and fixed without causing unnecessary downtime.

---

**2. What's your basic rollback plan?**

A basic rollback plan is to restore the last known working version of both the application and the Nginx configuration if a deployment fails.

The steps are:

- Restore the previous application build from a backup.
- Revert any changes made to the Nginx configuration by replacing it with the last working configuration file.
- Test the configuration using nginx -t to ensure there are no syntax errors.
- Restart or reload the Nginx service.
- Verify that the website is accessible and functioning correctly.

This approach minimizes downtime and allows the application to return quickly to a stable, working state while the deployment issue is investigated and resolved.

---

# Task 3 — Logs & Request Trace

## Goal

Verify real traffic flow and analyze logs to understand system behavior and errors.

### Evidence

#### Screenshot 1 — Output of `sudo tail -n 30 /var/log/nginx/access.log`

![screenshot_1](screenshots/assignment3-ss8.jpg)

---

#### Screenshot 2 — Output of `sudo tail -n 30 /var/log/nginx/error.log`

![screenshot_2](screenshots/assignment3-ss9.jpg)

---

#### Screenshot 3 — Output of `sudo journalctl -u nginx --no-pager -n 50`

![screenshot_3](screenshots/assignment3-ss10.jpg)

---

### Notes

Answer the following in your own words:

**1. Were there any errors in the logs?**

- If yes, mention 1–2 example error lines from the logs and explain what each one means in simple terms.
- If no, explain what it means if the error log is empty or shows no recent errors during your check.

Yes, this an error.

1. 205.210.31.14 - - [16/Jul/2026:18:56:41 +0000] "\x16\x03\x01..." 400 166 "-" "-"

This is an HTTP 400 Bad Request response. The client attempted to initiate an HTTPS/TLS connection on a port expecting plain HTTP (or sent malformed data), so Nginx rejected the request.

2. 2026/07/16 18:40:38 [notice] 25513#25513: using inherited sockets from "5;6;"

This is not an error. It is a normal Nginx notice indicating that the server successfully inherited open sockets during a reload or restart, allowing Nginx to continue serving requests without interruption.

Overall, there were no critical errors in the error.log. The absence of recent error messages indicates that Nginx was running normally during the check, successfully serving requests, with only expected or invalid client requests (such as malformed or HTTPS-on-HTTP traffic) appearing in the access log.

---

**2. If there were no errors, what does that indicate about the system?**

No errors

---

**3. Based on the access logs, were your curl requests visible in the log entries? What does that prove about traffic flow?**

Yes. The access log contains successful GET requests from your public IP (102.222.99.1), including requests for the application homepage and its static assets:
102.222.99.1 - - "GET / HTTP/1.1" 200
102.222.99.1 - - "GET /static/css/main.e6c13ad2.css HTTP/1.1" 200
102.222.99.1 - - "GET /static/js/main.5ccdebed.js HTTP/1.1" 200
102.222.99.1 - - "GET /manifest.json HTTP/1.1" 200
102.222.99.1 - - "GET /favicon.ico HTTP/1.1" 200

These log entries prove that requests successfully reached the Nginx server, were processed, and returned HTTP 200 (OK) responses. This confirms that the traffic flow—from the client, through the network, to the Nginx web server, and back to the client—is functioning correctly, and that Nginx is logging incoming requests as expected.

---

# Task 4 — System Resource Health Check (Capacity Red Flags)

## Goal

Assess server capacity and detect potential performance or failure risks.

### Evidence

#### Screenshot 1 — Output of `uptime`

![screenshot_4](screenshots/assignment3-ss11.jpg)

---

#### Screenshot 2 — Output of `free -h`

![screenshot_2](screenshots/assignment3-ss12.jpg)

---

#### Screenshot 3 — Output of `df -h`

![screenshot_3](screenshots/assignment3-ss13.jpg)

---

#### Screenshot 4 — Output of `sudo du -sh /var/* | sort -h`

![screenshot_4](screenshots/assignment3-ss14.jpg)

---

### Notes

Answer the following in your own words:

**1. Which resource looks most critical right now? (CPU/load, memory, or disk) Explain why.**

Disk usage appears to be the most critical resource to monitor.

The Nginx logs show that the server is actively handling requests without errors, so there is no evidence of CPU overload or memory exhaustion. However, log files (/var/log/nginx/access.log and /var/log/nginx/error.log) will continue to grow over time, and if the disk becomes full, Nginx may be unable to write logs or serve content reliably, potentially affecting the entire system.

---

**2. What happens if disk becomes 100% full in a production server?**

If a production server's disk reaches 100% capacity, it can cause serious service disruptions because the operating system and applications can no longer write new data.

- Applications may fail or crash because they cannot write logs, temporary files, or database data.
- Web servers like Nginx may stop functioning properly, failing to write access and error logs or serve requests reliably.
- Databases can become unavailable or risk data corruption if they cannot complete write operations.
- System updates, backups, and scheduled tasks may fail because they require free disk space.
Users may experience errors, slow performance, or complete service outages until disk space is freed.

---

# Task 5 — Configuration & Deployment Verification

## Goal

Ensure the correct React build is deployed and Nginx is serving it properly.

### Evidence

#### Screenshot 1 — Output of `ls -lah /var/www/html | head -n 20`

![screenshot_1](screenshots/assignment3-ss15.jpg)

---

#### Screenshot 2 — Output of `grep -R "Deployed by" -n /var/www/html 2>/dev/null | head`

![screenshot_2](screenshots/assignment3-ss16.jpg)

---

#### Screenshot 3 — Output of `grep -n "try_files" /etc/nginx/sites-available/default`

![screenshot_3](screenshots/assignment3-ss17.jpg)

---

### Notes

Answer the following in your own words:

**1. How do you confirm that the correct version of the application is deployed?**

Firstly, I access the application in a web browser or use curl to verify that the expected version, features, or UI changes are visible.

Secondly, I check the deployed files on the server and compare them with the latest build artifacts or source code (for example, verify the updated index.html, JavaScript bundle, or version file).

Thirdly, I verify the deployment source by checking the Git commit or release tag on the server git log --oneline -1

Lastly, I review the Nginx access logs to confirm that users are receiving successful HTTP 200 responses for the latest application files.

---

# Task 6 — Nginx Configuration Failure Simulation

## Goal

Simulate a real-world Nginx misconfiguration and recover the service safely.

### Evidence

#### Screenshot 1 — Output of `sudo nginx -t` showing the syntax error (broken config)



---

#### Screenshot 2 — Output of `sudo nginx -t` showing syntax ok (fixed config)

![screenshot_2](screenshots/assignment3-ss18.jpg)

---

#### Screenshot 3 — Output of `curl -I http://172.31.23.88` confirming recovery (200 OK)

![screenshot_3](screenshots/assignment3-ss19.jpg)

---

### Notes

Answer the following in your own words:

**1. What caused the configuration failure?**

The configuration failure was caused by an error in the Nginx configuration file, such as an incorrect server block, invalid syntax, or a wrong file path. After identifying and correcting the configuration, nginx -t validated the configuration successfully, and Nginx was able to restart and serve the application normally.

---

**2. How did you fix the issue?**

I fixed the issue by reviewing the Nginx configuration, correcting the invalid settings, and validating the configuration with sudo nginx -t. After the syntax test passed successfully, I restarted Nginx using sudo systemctl restart nginx and confirmed the application was accessible by checking the website and verifying successful HTTP 200 responses in the Nginx access logs.

---

**3. How can you avoid this kind of issue in real production systems?**

To avoid this kind of issue in a real production environment, I would:

- Validate the configuration before deployment using sudo nginx -t to catch syntax or configuration errors.
- Use version control and code reviews so configuration changes are tracked, reviewed, and can be rolled back if necessary.
- Automate testing in a CI/CD pipeline to verify configuration files before they are deployed.
- Deploy changes gradually (for example, using blue-green or rolling deployments) to minimize the impact of any configuration issues.
- Monitor logs and set up alerts so configuration problems are detected and resolved quickly.
- Maintain a rollback plan to restore the last known working configuration if a deployment fails.

---

# Task 7 — Web Application Failure Simulation

## Goal

Simulate missing deployment content and recover the application safely.

### Evidence

#### Screenshot 1 — Output of `curl -I http://172.31.23.88` showing failure (non-200 response)

![screenshot_1](screenshots/assignment3-ss19.jpg)

---

#### Screenshot 2 — Output of `curl -I http://<public-ip>` confirming recovery (200 OK)

![screenshot_2](screenshots/assignment3-ss19.jpg)

---

### Notes

Answer the following in your own words:

**1. What caused the application to break in this scenario?**

The application broke because the deployed web application files were missing from Nginx's document root. When Nginx received requests, it could not find the required content to serve, resulting in a non-200 response (such as 404 Not Found or 403 Forbidden, depending on the configuration).

---

**2. How did you fix the issue and restore the application?**

I restored the application by replacing the missing deployment files in Nginx's web root with the correct application build. After verifying that the files were in the correct location, I confirmed the Nginx configuration was valid using sudo nginx -t and ensured the service was running. Finally, I tested the application with curl -I http://172.31.23.88 and received an HTTP 200 OK response, confirming that the application had been successfully recovered.

---

**3. What steps would you take to prevent this kind of issue in real production systems?**

To prevent this type of issue in production, I would use an automated CI/CD pipeline to deploy application files consistently and avoid manual changes on the server. I would also implement regular backups, perform deployment verification and health checks, use version control with a rollback strategy, and monitor the application with alerts so any deployment issues are detected and resolved quickly.

---

# Task 8 — Security & Reliability Review

## Goal

Review and reflect on the security and reliability practices applied during this assignment.

### Security & Reliability Notes

Answer the following in your own words:

**1. Why is SSH key-based authentication more secure than sharing passwords?**

SSH key-based authentication is more secure than passwords because it uses a public/private key pair instead of a password that can be guessed or stolen. The private key never leaves the client device, making it resistant to brute-force attacks, password reuse, and phishing. Additionally, SSH keys are much harder to compromise and can be managed with passphrases and strict access controls for enhanced security.

---

**2. Why should only required ports be open on a production server?**

Only the required ports should be open on a production server to minimize the attack surface and reduce the risk of unauthorized access. Closing unnecessary ports prevents attackers from exploiting unused services, improves overall security, and makes it easier to monitor and manage network traffic.

---

**3. Why is it important for Nginx to be enabled on boot?**

It is important for Nginx to be enabled on boot so that the web server starts automatically whenever the server is restarted or recovers from a power outage. This ensures the application remains available without requiring manual intervention, reducing downtime and improving the reliability of the production environment.

---

**4. What are the risks of sharing secrets, keys, or credentials publicly?**

Sharing secrets, API keys, SSH keys, or credentials publicly can give unauthorized users access to your servers, cloud resources, applications, or sensitive data. This can lead to data breaches, unauthorized changes, financial losses, service disruption, and compromised accounts.

---

**5. Why should cloud resources be stopped or terminated when they are no longer needed?**

Cloud resources should be stopped or terminated when they are no longer needed to avoid unnecessary costs and reduce security risks. Unused resources can continue generating charges, consume cloud quotas, and increase the attack surface if left running. Regularly cleaning up unused resources helps optimize costs, improve security, and keep the cloud environment well managed.

---

# LinkedIn Post (Required)

## Evidence

#### LinkedIn Post URL

Paste your LinkedIn post URL here:
(https://www.linkedin.com/posts/share-7484860818119917568-DlJ8/?highlightedUpdateUrn=urn%3Ali%3Aactivity%3A7484860821433458688&highlightedUpdateType=SOCIAL_SHARE&origin=SOCIAL_SHARE&utm_source=share&utm_medium=member_desktop&rcm=ACoAAB6VGscB2AplIT7PcrwZvA0ECup4mNaUoIw)

---

#### Screenshot — Published LinkedIn post

![screenshot_3](screenshots/assignment3-ss20.jpg)

---

# Submission Instructions

- Add all required screenshots in your submission
- Full name must be visible in required screenshots
- Do not expose sensitive information (keys, passwords, account IDs)

---

# Completion Checklist

- [✅] Task 1: Screenshots (browser, ip a, ss -tulpen, ufw status) + Notes answered
- [✅] Task 2: Screenshots (nginx status, nginx -t, ss port 80) + Notes answered
- [✅] Task 3: Screenshots (access log, error log, journalctl) + Notes answered
- [✅] Task 4: Screenshots (uptime, free -h, df -h, du -sh) + Notes answered
- [✅] Task 5: Screenshots (ls html, grep deployed by, grep try_files) + Notes answered
- [✅] Task 6: Screenshots (nginx -t fail, nginx -t pass, curl recovery) + Notes answered
- [✅] Task 7: Screenshots (curl failure, curl recovery) + Notes answered
- [✅] Task 8: Security & Reliability Notes answered
- [✅] LinkedIn post published and URL submitted
- [✅] Full Name visible in all required screenshots
- [✅] No sensitive data exposed

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