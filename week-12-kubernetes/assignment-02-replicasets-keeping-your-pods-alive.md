# Assignment 02 — ReplicaSets: Keeping Your Pods Alive

Part of the DevOps Micro Internship (DMI) with Agentic AI

---

## Purpose

In this assignment, you will create three NGINX Pods using a ReplicaSet, test auto-healing by deleting one Pod, and scale the ReplicaSet from three to five Pods.

---

# Task 0 — Pre-check: Remove the Pod from Assignment 01

## Goal

Confirm that you are connected to your learning cluster and remove the previous standalone Pod to prevent the ReplicaSet from adopting it.

### Evidence

No screenshots required.

---

# Task 1 — Set Up Your Working Directory

## Goal

Create and enter a dedicated directory for this ReplicaSet lab.

### Evidence

#### Screenshot 01 — Output of `pwd` showing the working directory ending in `/k8s-labs/replicasets`

![alt text](<screenshots/week 12-assignment 2-task1-screenshot1.JPG>)

---

### Notes

**1. Why is it useful to keep Kubernetes manifests in organized directories?**

Keeping manifests organized in dedicated directories (such as ~/k8s-labs/replicasets) ensures clean version control, makes it easier to apply and manage configurations per lab assignment, and prevents resource name collisions or accidental overwrites across different projects.

---

**2. What file will you create in this directory for this assignment?**

I will create your ReplicaSet YAML configuration file (such as 01-replicaset.yaml or your specific lab manifest files) to define the desired state for your pods and replica counts.

---

# Task 2 — Create and Apply the NGINX ReplicaSet

## Goal

Create a ReplicaSet that maintains three NGINX Pods.

### Evidence

#### Screenshot 02 — Completed `nginx-replicaset.yaml` manifest showing `replicas: 3`

![alt text](<screenshots/week 12-assignment 2-task2-screenshot2.JPG>)

---

#### Screenshot 03 — Output of `kubectl apply -f nginx-replicaset.yaml`

![alt text](<screenshots/week 12-assignment 2-task2-screenshot3.JPG>)

---

#### Screenshot 04 — Output of `kubectl get pods` showing three NGINX Pods with `1/1` under `READY` and `Running` under `STATUS`

![alt text](<screenshots/week 12-assignment 2-task2-screenshot4.JPG>)
---

### Notes

**1. What does `replicas: 3` mean in this manifest?**

It instructs Kubernetes to ensure that exactly three identical instances (pods) of the NGINX application are running at all times. If a pod crashes or is deleted, the ReplicaSet will automatically spin up a replacement to maintain the desired count of three.

---

**2. Why must `selector.matchLabels` match `template.metadata.labels`?**

Kubernetes uses selector.matchLabels to identify which pods fall under the management of this ReplicaSet. These labels must exactly match the pod template labels (template.metadata.labels) so that the ReplicaSet knows which newly created pods it is responsible for tracking and controlling.

---

**3. What image and image tag are used for the NGINX container?**

The official NGINX image (nginx) with the latest tag is used in this configuration.

---

# Task 3 — Test ReplicaSet Auto-Healing

## Goal

Delete one Pod managed by the ReplicaSet and observe Kubernetes automatically create a replacement.

### Evidence

#### Screenshot 05 — Output of the command deleting one ReplicaSet-managed Pod

![alt text](<screenshots/week 12-assignment 2-task3-screenshot5.JPG>)

---

#### Screenshot 06 — Output of `kubectl get pods` showing the replacement Pod with a different name from the deleted Pod

![alt text](<screenshots/week 12-assignment 2-task3-screenshot6.JPG>)
---

#### Screenshot 07 — Output showing three NGINX Pods with `1/1` under `READY` and `Running` under `STATUS` again

![alt text](<screenshots/week 12-assignment 2-task3-screenshot7.JPG>)

---

### Notes

**1. What happened after you deleted one Pod?**

Kubernetes immediately detected that the active pod count dropped below the desired count of 3, prompting the ReplicaSet controller to automatically create a brand new replacement pod.


---

**2. How does the ReplicaSet know that a replacement Pod is needed?**

The ReplicaSet controller continuously monitors the cluster state through the API server. When it compares the actual number of pods matching its selector.matchLabels against the replicas specification (3), it triggers creation or deletion actions to reconcile the difference.

---

**3. What proves that auto-healing worked successfully?**

The active pod list returned to exactly three running instances, and the newly created pod possessed a distinct random suffix/name while achieving Running status and 1/1 readiness.

---

# Task 4 — Manually Scale the ReplicaSet

## Goal

Scale the ReplicaSet from three NGINX Pods to five NGINX Pods by changing the YAML manifest.

### Evidence

#### Screenshot 08 — Updated `nginx-replicaset.yaml` showing `replicas: 5`

![alt text](<screenshots/week 12-assignment 2-task4-screenshot8.JPG>)

---

#### Screenshot 09 — Output of `kubectl get pods` showing five NGINX Pods with `1/1` under `READY` and `Running` under `STATUS`

![alt text](<screenshots/week 12-assignment 2-task4-screenshot9.JPG>)

---

### Notes

**1. What change did you make to scale the ReplicaSet?**

I updated the replicas field in the nginx-replicaset.yaml manifest file from 3 to 5 and reapplied it using kubectl apply

---

**2. Did you manually create the additional Pods? Explain why or why not.**

No, I did not manually create the additional pods. The ReplicaSet controller automatically detected the new desired state (replicas: 5) and dynamically provisioned two new pods to reconcile the difference.

---

**3. What would happen if you changed the replica count from five back to three?**

The ReplicaSet controller would automatically select and terminate two of the running pods to bring the active count back down to the desired total of three.

---

# LinkedIn Requirement

Create a LinkedIn post that includes:

- A short explanation of what a Kubernetes ReplicaSet does.
- What happened when you deleted one NGINX Pod.
- How Kubernetes automatically created a replacement Pod to maintain the desired replica count.
- What you learned by changing the replica count from three to five.
- One screenshot showing either:
  - Three Pods running after the auto-healing test, or
  - Five Pods running after scaling the ReplicaSet.

Do not share sensitive information, cluster credentials, tokens, or kubeconfig details in your post.

### Evidence

#### Screenshot 10 — Published LinkedIn post showing your name, the required explanation, and the attached Pod screenshot



---

### Post Link



---

# Submission Instructions

- Add all required screenshots, numbered 01–10, to this template.
- Full Name must be visible in required screenshots.
- Ensure screenshots are clear and readable.
- Submit the final `nginx-replicaset.yaml` file showing `replicas: 5`. Screenshot 02 provides evidence of the initial manifest with `replicas: 3`.
- Complete the Notes sections in Tasks 1–4 in your own words.
- Include the published LinkedIn post URL.
- Do not expose tokens, passwords, private keys, kubeconfig files, or account IDs.

---

# Completion Checklist

- [ ] Completed Task 0 and confirmed that the previous `nginx-pod` is no longer listed
- [ ] Created and entered the ReplicaSet working directory (Screenshot 01)
- [ ] Created `nginx-replicaset.yaml` with an initial replica count of three (Screenshot 02)
- [ ] Applied the ReplicaSet manifest successfully (Screenshot 03)
- [ ] Confirmed three NGINX Pods are running (Screenshot 04)
- [ ] Deleted one ReplicaSet-managed Pod (Screenshot 05)
- [ ] Observed the automatically created replacement Pod (Screenshot 06)
- [ ] Confirmed three NGINX Pods are running again (Screenshot 07)
- [ ] Changed the replica count from three to five (Screenshot 08)
- [ ] Confirmed five NGINX Pods are running (Screenshot 09)
- [ ] Submitted the final `nginx-replicaset.yaml` file with `replicas: 5`
- [ ] Completed the Notes sections in Tasks 1–4
- [ ] Published the LinkedIn post with the required explanation and Pod screenshot (Screenshot 10)
- [ ] Included the published LinkedIn post URL
- [ ] Included all required screenshots
- [ ] No sensitive data exposed

---

## 📌 About DMI & CloudAdvisory

DevOps Micro Internship (DMI) is a project-based DevOps program run by Pravin Mishra (The CloudAdvisory) focused on real-world execution, systems thinking, and career readiness.

It helps learners build strong DevOps foundations with hands-on experience.

---

## 📌 Resources

- 🌐 DMI Official Website: https://dmi.pravinmishra.com?utm_source=github&utm_medium=readme  
- 🎓 University: https://university.pravinmishra.com?utm_source=github&utm_medium=readme  
- 💬 Discord Community: https://discord.pravinmishra.com?utm_source=github&utm_medium=readme  
- 📝 Blog: https://dmi.pravinmishra.com/blog?utm_source=github&utm_medium=readme  
- ▶️ YouTube Playlist: https://www.youtube.com/playlist?list=PLFeSNDtI4Cho  
- 🔗 Pravin Mishra (LinkedIn): https://www.linkedin.com/in/pravin-mishra-aws-trainer/  
- 🏢 CloudAdvisory (LinkedIn): https://www.linkedin.com/company/thecloudadvisory/

---

*This submission is part of DevOps Micro Internship (DMI) — Agentic AI Track.*
