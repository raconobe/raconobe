To push a project to GitHub using a Personal Access Token (PAT), initialize your local repository, link it to your remote GitHub repo, and paste your token when prompted for your password.

1. **Initialize your local repository:** Run inside your project directory.
Generate your initial local git history:

```bash
git init
git add .
git commit -m "Initial commit"
git branch -M main

```


2. **Create a new repository on GitHub:** Do not initialize with files.
1. Go to [github.com/new](https://github.com/new).
2. Enter your repository name.
3. Leave **Add a README file**, **.gitignore**, and **license** unchecked.
4. Click **Create repository**.

3. **Add the remote repository URL:**
Connect your local workspace to your GitHub repository by running:

```bash

git remote add origin https://github.com/USERNAME/REPO_NAME.git

 
``` 
```Git
git remote add origin  https://github.com/raconobe/raconobe.git
```



*(Replace `USERNAME` and `REPO_NAME` with your actual GitHub account and repository details.)*


4. **Push your code and authenticate:**
Execute the push command:

```bash
git push -u origin main

```

When prompted in your terminal:

* **Username:** Enter your GitHub username.
* **Password:** Paste your **Personal Access Token (PAT)** *(characters will not appear as you paste)*.


> **Note on Storing Your Token:**
> If you do not want to paste your token every time you push, save it locally using Git's credential store:
> `git config --global credential.helper store`
> Alternatively, set the remote URL to embed the token directly (stores in `.git/config` in plain text):
> `git remote set-url origin [https://YOUR_TOKEN@github.com/USERNAME/REPO_NAME.git](https://YOUR_TOKEN@github.com/USERNAME/REPO_NAME.git)`

```
https://YOUR_TOKEN@github.com/USERNAME/REPO_NAME.git
```

---



----
---


Setting up SSH authentication replaces Personal Access Tokens with a public/private key pair on your computer, eliminating password prompts during Git operations.

1. **Generate a new SSH key pair:** Ed25519 algorithm is recommended for modern security and performance.
Open your terminal and run the following command (replace with your GitHub email):

```bash
ssh-keygen -t ed25519 -C "your_email@example.com"

```

```bash
ssh-keygen -t ed25519 -C "raconobe@gmail.com"

```

When prompted to "Enter file in which to save the key", press **Enter** to accept the default location (`~/.ssh/id_ed25519`). You can optionally enter a passphrase for extra security.


2. **Start the SSH agent and register your key:** Keeps your private key loaded in memory.
Initialize the SSH agent service and register your newly generated private key:

```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

```


3. **Copy your public key:**
Display your public key content to copy it to your clipboard:

```bash
cat ~/.ssh/id_ed25519.pub

```

*(On macOS, you can use `pbcopy < ~/.ssh/id_ed25519.pub`; on Windows PowerShell, use `Get-Content ~/.ssh/id_ed25519.pub | Set-Clipboard`.)*


4. **Add the public key to your GitHub account:**
1. Navigate to **[GitHub Settings > SSH and GPG keys](https://github.com/settings/keys)**.
2. Click **New SSH key**.
3. Set a descriptive **Title** (e.g., "Work Laptop").
4. Keep **Key type** set to *Authentication Key*.
5. Paste your key into the **Key** box and click **Add SSH key**.


5. **Test your connection and switch repository remote:**
Test that GitHub recognizes your key:

```bash
ssh -T git@github.com

```

*(Type `yes` if prompted about host authenticity. You should see a message confirming successful authentication.)*

Update your local repository's remote URL to use SSH instead of HTTPS:

```bash
git remote set-url origin git@github.com:USERNAME/REPO_NAME.git

```


---

ññññ

---
The error occurs for two reasons: `eval` is a Linux/Bash command not recognized by PowerShell, and the Windows OpenSSH Agent service is currently disabled on your system (**Error 1058**).

1. **Enable and start the OpenSSH Agent service (as Administrator):** Required once to fix Error 1058.
1. Open the Windows Start Menu, search for **PowerShell**, right-click it, and select **Run as administrator**.
2. Run these commands to set the service to start automatically and launch it:

```powershell
Set-Service -Name ssh-agent -StartupType Automatic
Start-Service ssh-agent

```


2. **Add your SSH key to the agent:** Run in your regular PowerShell terminal.
Switch back to your normal PowerShell window (where your project is open) and run:

```powershell
ssh-add ~/.ssh/id_ed25519

```


3. **Verify your key is registered:**
Confirm that the key was successfully added:

```powershell
ssh-add -l

```

You should see your key's fingerprint printed in the terminal.


> **Git Bash Alternative:** If you prefer using Bash syntax like `eval "$(ssh-agent -s)"`, open **Git Bash** instead of PowerShell inside your terminal or VS Code.



