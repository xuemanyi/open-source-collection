# Open Source Collection

A structured repository for managing third-party open source projects using Git submodules.

---

## 📁 Repository Structure

```
.
├── docs/                  # Documentation (auto-generated / manual)
├── scripts/               # Submodule management scripts
├── third_party/           # Third-party open source projects (submodules)
└── tools/                 # Utility scripts
```

---

## 🚀 Quick Start

### 1. Clone with submodules

```bash
git clone --recurse-submodules <repo_url>
cd open-source-collection
```

### 2. If cloned without submodules

```bash
bash scripts/bootstrap.sh
```

---

## ⚙️ Script Usage

All maintenance operations are handled via scripts in `scripts/`.

---

### 🔧 bootstrap.sh

**Purpose:** Initialize and fetch all submodules after clone.

```bash
bash scripts/bootstrap.sh
```

**What it does:**

* Sync `.gitmodules` configuration
* Initialize submodules
* Fetch all submodule content recursively

---

### 🔄 update_submodules.sh

**Purpose:** Update all submodules to the latest upstream commits.

```bash
bash scripts/update_submodules.sh
```

**What it does:**

* Sync submodule configuration
* Pull latest changes from each submodule remote
* Show updated submodule status

**After running:**

```bash
git status
git diff --submodule
git add .
git commit -m "chore: update submodules"
```

---

### 🔁 sync_submodules.sh

**Purpose:** Sync local submodule config with `.gitmodules`.

```bash
bash scripts/sync_submodules.sh
```

**Use case:**

* After modifying `.gitmodules`
* When submodule URLs change

---

### 📄 generate_projects_md.sh

**Purpose:** Generate project inventory automatically.

```bash
bash scripts/generate_projects_md.sh
```

**Output:**

* `docs/PROJECTS.md`

**Content includes:**

* Submodule name
* Path
* Remote URL

---

## 🧪 Tools

### repo_health_check.sh

**Purpose:** Check repository health.

```bash
bash tools/repo_health_check.sh
```

**Checks:**

* `.gitmodules` existence
* `third_party/` structure
* Git status
* Submodule status

---

## ➕ Add New Submodule

```bash
git submodule add <repo_url> third_party/<name>
bash scripts/generate_projects_md.sh
git add .
git commit -m "feat: add <name> submodule"
```

---

## 🔄 Update Workflow

```bash
bash scripts/update_submodules.sh
git status
git diff --submodule
git add .
git commit -m "chore: update submodules"
git push
```

---

## 📌 Rules

* All third-party projects must be under `third_party/`
* Do not manually move submodules using `mv`
* Do not modify third-party code directly
* Always review submodule updates before commit

---

## ⚠️ Common Pitfalls

### ❌ Duplicate submodules

Caused by:

* Moving directories manually
* Re-adding without cleanup

Fix:

```bash
git submodule deinit -f .
rm -rf .git/modules/*
```

Then re-add cleanly.

---

## 📚 Project Inventory

See:

```
docs/PROJECTS.md
```

Generated via:

```bash
bash scripts/generate_projects_md.sh
```

---

## 🧠 Design Philosophy

This repository:

* Tracks upstream projects without modifying them
* Uses submodules for reproducibility
* Separates third-party code from local scripts/tools
* Provides automation for maintenance

---

## 📄 License

This repository contains only:

* Scripts
* Metadata

Each submodule retains its original license.
