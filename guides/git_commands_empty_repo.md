---

# Git Setup & Workflow Guide (Local Credentials Only)

### Step 1: Initialize Local Repository

Open PowerShell inside your project folder and run:

```powershell
git init
git branch -M main
git remote add origin https://github.com/<USERNAME>/<REPO_NAME>.git
git add .
git commit -m "Initial commit"
```

---

```powershell
git init
git branch -M main
git remote add origin https://github.com/<USERNAME>/<REPO_NAME>.git
git add .
git commit -m "Initial commit"
```

---

```
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin git@github.com-personal:raconobe/my_project_02.git
```

---

### Step 2: Set Local Authentication

To store your credentials strictly inside this repository's `.git/config` file (preventing any global system changes), embed your Personal Access Token (PAT) directly into the remote URL:

```powershell
git remote set-url origin https://<YOUR_TOKEN>@github.com/<USERNAME>/<REPO_NAME>.git
```

> **Note:** Because the token is embedded in the URL, Git will perform pushes instantly without asking for a username or password.

---

### Step 3: Perform Initial Push

Upload your initial files to GitHub:

```powershell
git push -u origin main
```

*(Use `git push -u origin main --force` only if the remote repository was created with an automatic `README` or `LICENSE` file that you want to overwrite.)*

---

### Step 4: Daily Workflow (Ongoing Updates)

Use these commands whenever you want to save and push new changes.

**Standard Step-by-Step**

1. Stage modified or new files:
   
   ```powershell
   git add .
   ```

```
2. Save a snapshot locally:
```powershell
git commit -m "Your commit message"
```

3. Push local changes to GitHub:
   
   ```powershell
   git push
   ```

```
**One-Line Shortcuts**

* **PowerShell 7 / Git Bash (Recommended):** Stops automatically if an earlier step fails.
```powershell
git add . && git commit -m "Update code" && git push
```

* **Standard Windows PowerShell:** Runs each command sequentially.
  
  ```powershell
  git add . ; git commit -m "Update code" ; git push
  ```

```