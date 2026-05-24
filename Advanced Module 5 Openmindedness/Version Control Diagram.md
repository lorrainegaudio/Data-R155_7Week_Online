## **Diagram Layout**

### **Left Side: Local Computer**

Label this section:

**Your Local Computer**

Show the full folder path and project contents:

```
DATA-R155/
└── data-r155-github-practice/
   ├── data-r155-github-practice.Rproj   Local project file
   ├── README.md                         Tracked by Git
   ├── .gitignore                        Tracked by Git
   ├── github_practice.Rmd               Tracked by Git
   └── data/                             Local only / ignored
```

This side should make clear that the student’s computer contains **more than what appears on GitHub**.

---

### **Middle: Git Tracking and Push Step**

Place a simple arrow between the local folder and GitHub:

```
Git tracks selected files
       +
Push sends tracked files to GitHub
```

The arrow should not imply that the entire local folder is copied to GitHub. A useful label would be:

```
Only tracked files that are pushed appear on GitHub
```

---

### **Right Side: GitHub Repository**

Label this section:

**GitHub Repository**

Show only the final repository contents:

```
data-r155-github-practice/
├── README.md
├── .gitignore
└── github_practice.Rmd
```

This makes the contrast obvious: GitHub is not a mirror of the whole local computer folder.

---

## **Visual Design Instructions**

Use two large boxes:

```
┌──────────────────────────────┐        ┌──────────────────────────────┐
│ Your Local Computer           │        │ GitHub Repository             │
│ Full project folder           │        │ Tracked + pushed files only   │
│                              │        │                              │
│ DATA-R155/                    │        │ data-r155-github-practice/    │
│ └── data-r155-github-practice/│        │ ├── README.md                 │
│     ├── .Rproj                │        │ ├── .gitignore                │
│     ├── README.md             │        │ └── github_practice.Rmd       │
│     ├── .gitignore            │        │                              │
│     ├── github_practice.Rmd   │        │                              │
│     └── data/                 │        │                              │
└──────────────────────────────┘        └──────────────────────────────┘
             │
             └──── Git tracks selected files, then push sends them ────▶
```

---

## **Accuracy Notes for the Diagram**

Avoid showing a “Version Database” as a separate visible box unless you are ready to explain the hidden `.git/` folder. For beginners, that adds unnecessary confusion and may make them think there is a shared database somewhere.

A better optional note is:

```
Git quietly keeps version history inside the local project folder,
but students usually interact with the files they can see.
```

The diagram should emphasize the practical beginner-level distinction:

```
Local computer = full working project folder
GitHub = online view of tracked files that were pushed
```

