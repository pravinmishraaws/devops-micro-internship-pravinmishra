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

![React app with your Full Name visible on the UI](./screenshots/W3-SS-A3/W3-A3-SS-1.png)

---

#### Screenshot 2 — Output of `ip a`

![Output of `ip a](./screenshots/W3-SS-A3/W3-A3-SS-2.png)

---

#### Screenshot 3 — Output of `sudo ss -tulpen`

![Output of `sudo ss -tulpen](./screenshots/W3-SS-A3/W3-A3-SS-3.png)

---

#### Screenshot 4 — Output of `sudo ufw status`

![Output of sudo ufw status](./screenshots/W3-SS-A3/W3-A3-SS-4.png)

---

### Notes

Answer the following in your own words:

**1. What proves Nginx is listening on 0.0.0.0:80?**

The sudo ss -tulpen command output will show a line with 0.0.0.0:80 (or *:80) in the LISTEN state, with the process name nginx and its PID. This proves that the Nginx process is bound to all IPv4 interfaces (0.0.0.0) on port 80, making it accessible from any network interface.

---

**2. What proves SSH is active on port 22?**

The sudo ss -tulpen output will display a line showing 0.0.0.0:22 (or *:22) in the LISTEN state with the sshd process name and its PID. This confirms the SSH daemon is actively listening and accepting connections on port 22 across all IPv4 interfaces.

---

**3. Did you find any unexpected open ports? Explain briefly.**

No, there are no unexpected open ports.
The only TCP ports in LISTEN state are:

Port 80 (0.0.0.0:80) — Nginx serving the React application
Port 22 (SSH) — Remote access for system administration

Both are essential for a production web server and should be open. Port 53 (DNS) shown in the output is UDP and only listening on localhost (127.0.0.1), which is normal for systemd-resolved.

---

# Task 2 — Service Health & Systemd Validation (Nginx)

## Goal

Verify that Nginx is properly installed, running, enabled at boot, and safely configured.

### Evidence

#### Screenshot 1 — Output of `systemctl status nginx --no-pager`

![Output of systemctl status nginx --no-pager](./screenshots/W3-SS-A3/W3-A3-SS-5.png)

---

#### Screenshot 2 — Output of `sudo nginx -t`

![Output of sudo nginx -t](./screenshots/W3-SS-A3/W3-A3-SS-6.png)

---

#### Screenshot 3 — Output of `sudo ss -lptn '( sport = :80 )'`

![Output of sudo ss -lptn](./screenshots/W3-SS-A3/W3-A3-SS-7.png)

---

### Notes

Answer the following in your own words:

**1. What happens if Nginx fails to restart in production?**

The web application becomes unreachable immediately. Users attempting to access the site will see connection refused or timeout errors. This results in downtime — the entire service is offline until Nginx is restored. The application code is still running on the server, but without Nginx acting as the reverse proxy/web server, no one can reach it. The longer the outage, the higher the business impact.

---

**2. What's your basic rollback plan?**

1. Diagnose the issue — Run `sudo nginx -t` to check for configuration syntax errors
2. Check logs — Review `/var/log/nginx/error.log` and `journalctl -u nginx` to identify the root cause (port conflict, permission denied, bad config, etc.)
3. Revert to last good config — If the issue is a config change, restore the previous working version from backup or version control
4. Fix the problem — Address the root cause (e.g., fix syntax error, free up port 80, correct permissions)
5. Test restart — Run `sudo nginx -t` again to confirm syntax is valid
6. Restart service — Run `sudo systemctl restart nginx`
7. Verify recovery — Run `curl -I http://localhost` to confirm the service is responding with 200 OK
8. Monitor — Watch logs and system health for the next 5-10 minutes to ensure stability
9. Communicate — Notify stakeholders of the incident and time to resolution

---

# Task 3 — Logs & Request Trace

## Goal

Verify real traffic flow and analyze logs to understand system behavior and errors.

### Evidence

#### Screenshot 1 — Output of `sudo tail -n 30 /var/log/nginx/access.log`

![Output of sudo tail -n 30 /var/log/nginx/access.log](./screenshots/W3-SS-A3/W3-A3-SS-8.png)

---

#### Screenshot 2 — Output of `sudo tail -n 30 /var/log/nginx/error.log`

![Output of sudo tail -n 30 /var/log/nginx/error.log](./screenshots/W3-SS-A3/W3-A3-SS-9.png)


---

#### Screenshot 3 — Output of `sudo journalctl -u nginx --no-pager -n 50`

![Output of `sudo journalctl -u nginx --no-pager -n 50`](./screenshots/W3-SS-A3/W3-A3-SS-10.png)

---

### Notes

Answer the following in your own words:

**1. Were there any errors in the logs?**

- If yes, mention 1–2 example error lines from the logs and explain what each one means in simple terms.
- If no, explain what it means if the error log is empty or shows no recent errors during your check.

No. The error log contains only a single [notice]-level message from the Nginx startup on 2026/07/16 at 16:10:15, which is informational and indicates normal operation: "using inherited sockets from "5;6;"" — this is how systemd launches Nginx.

There are zero error-level or critical messages, which proves the Nginx process is stable and the configuration is correct.

---

**2. If there were no errors, what does that indicate about the system?**

This indicates the system is **stable and well-configured**. Nginx has been running without crashes, configuration errors, permission denied issues, or binding failures. It means the service is reliably serving traffic with no problems.

---

**3. Based on the access logs, were your curl requests visible in the log entries? What does that prove about traffic flow?**

Yes, my curl request is visible in the logs: 127.0.0.1 - - [17/Jul/2026:01:10:48 +0000] "HEAD / HTTP/1.1" 200 0 "-" "curl/8.18.0"

1. **Request reached Nginx** — The curl command successfully connected to Nginx on localhost (127.0.0.1)
2. **Nginx processed the request** — The server parsed the HTTP HEAD request for the root path `/`
3. **Application responded** — Status code 200 OK proves the React application is running and accessible through Nginx
4. **Logging is working** — Nginx captured and logged the request, timestamp, HTTP method, path, status code, and User-Agent
5. **The full request-response cycle completed** — No timeouts, connection refused, or server errors occurred

This demonstrates the **complete traffic flow**: client (curl) → Nginx (reverse proxy) → React app → response back to client. If any part of this chain was broken, the request would either fail to connect, return an error status code (4xx/5xx), or not appear in the logs at all.

The presence of this logged request proves the web server is alive, responding correctly, and all network layers are functioning as expected.

---

# Task 4 — System Resource Health Check (Capacity Red Flags)

## Goal

Assess server capacity and detect potential performance or failure risks.

### Evidence

#### Screenshot 1 — Output of `uptime`

![uptime](./screenshots/W3-SS-A3/W3-A3-SS-11.png)

---

#### Screenshot 2 — Output of `free -h`

![free -h](./screenshots/W3-SS-A3/W3-A3-SS-12.png)

---

#### Screenshot 3 — Output of `df -h`

![df -h](./screenshots/W3-SS-A3/W3-A3-SS-13.png)

---

#### Screenshot 4 — Output of `sudo du -sh /var/* | sort -h`

![sudo du -sh /var/* | sort -h](./screenshots/W3-SS-A3/W3-A3-SS-14.png)

---

### Notes

Answer the following in your own words:

**1. Which resource looks most critical right now? (CPU/load, memory, or disk) Explain why.**

**Disk is the most critical resource.**

The root filesystem (`/dev/root`) is at **59% capacity** with only 2.8G of 6.7G available. This is concerning on a small instance because:

- Load average (0.08, 0.10, 0.09) is excellent — very low CPU activity
- Memory (347Mi used of 931Mi) is healthy at only 37% usage, with 604Mi available
- Disk at 59% is approaching the danger zone. This is a t2.micro instance with limited storage, and once it fills past 80-90%, the system becomes unstable

---

**2. What happens if disk becomes 100% full in a production server?**

If the disk reaches 100% capacity:

1. New files cannot be written — Any process trying to log, cache, or save data will fail
2. Applications crash — Nginx cannot write to access/error logs; application processes may terminate unexpectedly
3. System becomes unstable — The OS cannot write temporary files, swap data, or system updates
4. Services go offline — Nginx fails to restart or reload config due to inability to write logs
5. Data corruption risk — Partial file writes or interrupted processes can corrupt existing data
6. No recovery possible — You cannot install updates or tools to fix the problem without freeing space first

Recovery requires:
- Manually deleting old logs or cache files (e.g., `sudo rm /var/log/*.log.1 /var/log/*.log.2`)
- Truncating large log files (e.g., `sudo truncate -s 0 /var/log/nginx/access.log`)
- This is a critical production incident requiring immediate intervention

Prevention: Set up log rotation, monitor disk usage with alerts, and establish a cleanup policy for logs before they consume all available space.

---

# Task 5 — Configuration & Deployment Verification

## Goal

Ensure the correct React build is deployed and Nginx is serving it properly.

### Evidence

#### Screenshot 1 — Output of `ls -lah /var/www/html | head -n 20`

![ls -lah /var/www/html | head -n 20](./screenshots/W3-SS-A3/W3-A3-SS-15.png)

---

#### Screenshot 2 — Output of `grep -R "Deployed by" -n /var/www/html 2>/dev/null | head`

![grep -R "Deployed by"](./screenshots/W3-SS-A3/W3-A3-SS-16.png)
![grep -R "Deployed by"](./screenshots/W3-SS-A3/W3-A3-SS-16-1.png)

---

#### Screenshot 3 — Output of `grep -n "try_files" /etc/nginx/sites-available/default`

![grep -n "try_files"](./screenshots/W3-SS-A3/W3-A3-SS-17.png)

---

### Notes

Answer the following in your own words:

**1. How do you confirm that the correct version of the application is deployed?**

Run `ls -lah /var/www/html` to verify:
- Timestamps match — All files dated Jul 16 16:23 proves they deployed together
- Correct files exist — index.html, asset-manifest.json, manifest.json, /static directory all present
- Correct ownership — Files owned by www-data (Nginx can serve them)
- Correct permissions — Files have -rwxr-xr-x permissions

Then test with `curl -I http://localhost/` to confirm the app returns HTTP 200 OK.

This proves the correct build is deployed and actively serving traffic.

---

# Task 6 — Nginx Configuration Failure Simulation

## Goal

Simulate a real-world Nginx misconfiguration and recover the service safely.

### Evidence

#### Screenshot 1 — Output of `sudo nginx -t` showing the syntax error (broken config)

![sudo nginx -t` showing the syntax error](./screenshots/W3-SS-A3/W3-A3-SS-18.png)

---

#### Screenshot 2 — Output of `sudo nginx -t` showing syntax ok (fixed config)

![sudo nginx -t` showing ok](./screenshots/W3-SS-A3/W3-A3-SS-19.png)

---

#### Screenshot 3 — Output of `curl -I http://<public-ip>` confirming recovery (200 OK)

![recovery (200 OK)](./screenshots/W3-SS-A3/W3-A3-SS-20.png)

---

### Notes

Answer the following in your own words:

**1. What caused the configuration failure?**

Nginx configuration syntax error. Removing the semicolon `;` from `try_files $uri /index.html;` violated Nginx directive syntax rules. Each directive in Nginx must end with a semicolon. When `sudo nginx -t` is run, it detects the syntax error and refuses to load the broken configuration. Nginx continues running the old config, but if a reload/restart is attempted, the service fails to start and the application becomes unreachable.

---

**2. How did you fix the issue?**

1. Identified the problem — Ran `sudo nginx -t` which reported the syntax error and pointed to the line number with the missing semicolon
2. Fixed the configuration — Used `sudo nano /etc/nginx/sites-available/default` to open the config file
3. Re-added the semicolon — Changed `try_files $uri /index.html` to `try_files $uri /index.html;`
4. Validated the fix — Ran `sudo nginx -t` again, received "syntax is ok, test is successful"
5. Restarted the service — Ran `sudo systemctl restart nginx` to load the corrected configuration
6. Verified recovery — Ran `curl -I http://localhost/` and received HTTP 200 OK, confirming the application is serving traffic again


---

**3. How can you avoid this kind of issue in real production systems?**

- Test first — Always run `sudo nginx -t` before restarting the service
- Backup config — Keep a copy of the working config before making changes
- Use version control — Store configs in Git so you can easily revert to previous working versions
- Document changes — Note what you changed and why in case you need to troubleshoot later
- Monitor alerts — Set up alerts to notify you if Nginx fails to restart or goes offline

---

# Task 7 — Web Application Failure Simulation

## Goal

Simulate missing deployment content and recover the application safely.

### Evidence

#### Screenshot 1 — Output of `curl -I http://<public-ip>` showing failure (non-200 response)

![showing failure (non-200 response)](./screenshots/W3-SS-A3/W3-A3-SS-21.png)

---

#### Screenshot 2 — Output of `curl -I http://<public-ip>` confirming recovery (200 OK)

![showing failure (200 OK)](./screenshots/W3-SS-A3/W3-A3-SS-22.png)

---

### Notes

Answer the following in your own words:

**1. What caused the application to break in this scenario?**

The deployed web application files were deleted. Running `sudo mv /var/www/html /var/www/html_backup` moved the entire application directory containing index.html, assets, and static files to a backup location. Then `sudo mkdir -p /var/www/html` created an empty directory in its place. With no files to serve, Nginx cannot find index.html or any application content, resulting in 404 errors or blank responses.

---

**2. How did you fix the issue and restore the application?**

1. Identified the problem — Ran `curl -I http://<public-ip>` and received HTTP 404 Not Found instead of 200 OK
2. Located the backup — Files were safe in `/var/www/html_backup` from step 1
3. Removed empty directory — Ran `sudo rm -rf /var/www/html` to delete the empty folder
4. Restored from backup — Ran `sudo mv /var/www/html_backup /var/www/html` to restore all application files
5. Restarted Nginx — Ran `sudo systemctl restart nginx` to reload the configuration
6. Verified recovery — Ran `curl -I http://<public-ip>` and received HTTP 200 OK, confirming the application is serving traffic again

---

**3. What steps would you take to prevent this kind of issue in real production systems?**

- Automated backups — Run nightly backups of `/var/www/html` to a separate storage location
- Use version control — Deploy from Git, not direct file operations
- Infrastructure-as-code — Use tools like Terraform or Docker to rebuild deployments reliably
- Blue-green deployments — Keep two deployment directories and switch between them, never delete the live version
- Read-only filesystems — Make production directories read-only to prevent accidental deletion
- Alerts on downtime — Monitor iaf the application stops responding and alert immediately
- Recovery procedures — Document how to restore from backup and test recovery regularly

---

# Task 8 — Security & Reliability Review

## Goal

Review and reflect on the security and reliability practices applied during this assignment.

### Security & Reliability Notes

Answer the following in your own words:

**1. Why is SSH key-based authentication more secure than sharing passwords?**

SSH keys use cryptographic key pairs (public and private) that are mathematically harder to crack than passwords. 
Passwords can be guessed, brute-forced, or shared accidently via email/chat. 
Keys cannot be reused across multiple attempts — each login attempt uses the unique private key. 
Keys also cannot be intercepted during login like passwords can. 
Once compromised, you can revoke a specific key without changing all passwords. 
For servers like your Ubuntu instance, key-based auth eliminates the risk of weak passwords entirely.

---

**2. Why should only required ports be open on a production server?**

Every open port is a potential attack surface. Your server only needs port 22 (SSH) for administration and port 80 (HTTP) for the web application. 
Any other open port (like 3000, 5000, database ports) gives attackers an extra entry point to probe for vulnerabilities. 
Closing unnecessary ports follows the security principle of "least privilege" — expose only what is absolutely needed. 
This reduces the attack surface and limits damage if one service is compromised.

---

**3. Why is it important for Nginx to be enabled on boot?**

If the server restarts unexpectedly (crash, power failure, maintenance), Nginx will automatically start without manual intervention. 
This means the application stays online automatically and users are not impacted by downtime. 
Without boot enablement, the server would come back up with no web server running — the application would be offline until someone manually starts Nginx. 
In production, this could mean hours of lost revenue and user frustration.

---

**4. What are the risks of sharing secrets, keys, or credentials publicly?**

Attackers can use exposed credentials to access your server, applications, databases, and cloud accounts. 
They can steal data, deploy malware, modify files, launch attacks on other systems using your server, or hold your service for ransom. 
Once a credential is public (even if deleted from GitHub), it's considered compromised because it may have been copied by bots. 
Recovery requires rotating all passwords, auditing access logs, and potential incident response. 
This is why secrets should never be committed to Git, never posted in Slack, and only stored in secure credential managers.

---

**5. Why should cloud resources be stopped or terminated when they are no longer needed?**

Cloud instances incur hourly charges regardless of whether they're being used. 
An idle t2.micro instance still costs money every hour it runs. 
If your Ubuntu instance has been used for training and you no longer need it, stopping or terminating it prevents unnecessary AWS charges. 
Terminating is permanent but free; stopping is reversible but still costs for storage. 
In production environments, this discipline prevents "forgotten" resources from accumulating and creating unexpected bills.

---

# LinkedIn Post (Required)

## Evidence

#### LinkedIn Post URL

Paste your LinkedIn post URL here: 

`https://www.linkedin.com/feed/update/urn:li:activity:7483769511716761600/`

---

#### Screenshot — Published LinkedIn post

![Published LinkedIn post](./screenshots/W3-SS-A3/W3-A3-SS-23.png)

---

# Submission Instructions

- Add all required screenshots in your submission
- Full name must be visible in required screenshots
- Do not expose sensitive information (keys, passwords, account IDs)

---

# Completion Checklist

- [✓] Task 1: Screenshots (browser, ip a, ss -tulpen, ufw status) + Notes answered
- [✓] Task 2: Screenshots (nginx status, nginx -t, ss port 80) + Notes answered
- [✓] Task 3: Screenshots (access log, error log, journalctl) + Notes answered
- [✓] Task 4: Screenshots (uptime, free -h, df -h, du -sh) + Notes answered
- [✓] Task 5: Screenshots (ls html, grep deployed by, grep try_files) + Notes answered
- [✓] Task 6: Screenshots (nginx -t fail, nginx -t pass, curl recovery) + Notes answered
- [✓] Task 7: Screenshots (curl failure, curl recovery) + Notes answered
- [✓] Task 8: Security & Reliability Notes answered
- [✓] LinkedIn post published and URL submitted
- [✓] Full Name visible in all required screenshots
- [✓] No sensitive data exposed

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