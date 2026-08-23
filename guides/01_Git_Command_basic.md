



Git
```                           
   https://github.com/raconobe/raconobe.git
```

…or create a new repository on the command line
```
echo "# raconobe" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/raconobe/raconobe.git
git push -u origin main
```




…or push an existing repository from the command line
```
git remote add origin https://github.com/raconobe/raconobe.git
git branch -M main
git push -u origin main



```






---

Versions
---

Your remote repository on GitHub contains commits that do not exist in your local repository yet. This usually happens when a repository is created on GitHub with an automatically generated `README.md`, `.gitignore`, or `LICENSE` file before pushing local code. Git blocks non-fast-forward pushes to prevent you from accidentally overwriting remote work.

**Option 1: Combine remote changes with local work (Recommended)**

Fetch the remote changes, rebase your local commits on top of them, and push:

```bash
git pull origin main --rebase
git push -u origin main

```

*Note: If Git throws an `unrelated-histories` error during the pull, allow the merge of two independent histories with:*

```bash
git pull origin main --allow-unrelated-histories
git push -u origin main

```

---

**Option 2: Overwrite the remote branch (Use only if remote files are unnecessary)**

If the remote repo only contains template files you do not need, you can force GitHub to accept your local repository state:

```bash
git push -u origin main --force

```

> **Warning:** `--force` permanently destroys any existing history or files on GitHub's `main` branch that are not present on your local machine.