# ✅ ToDoList App

![Swift](https://img.shields.io/badge/Swift-5.0-orange)
![UIKit](https://img.shields.io/badge/UIKit-%F0%9F%93%B1-lightgrey)
![CoreData](https://img.shields.io/badge/Storage-CoreData-blue)
![Realm](https://img.shields.io/badge/Storage-Realm-purple)
![SPM](https://img.shields.io/badge/SwiftPM-Compatible-brightgreen)
![License](https://img.shields.io/badge/License-MIT-blue.svg)
![Theme](https://img.shields.io/badge/Theme-Light%20%26%20Dark-black)

An iOS To-Do List app built using **Swift** and **UIKit**, featuring **custom UI components**, **centralized design fonts**, and a modular **MVC architecture**. The app supports **multiple persistence strategies** across branches — `CoreData` and `Realm`, with **Realm integrated via Swift Package Manager (SPM)**.

---

## ✨ Features

- 🗓️ Add, edit, delete, and categorize tasks easily
- 🌓 Full support for Light and Dark mode
- 💾 **Persistence Options:**
  - `main` branch uses in-memory models
  - `coredata` branch integrates **CoreData**
  - `realm` branch uses **Realm (via SPM)**
- 🎨 **Custom reusable buttons**:
  - `RoundedButton`
  - `ShadowButton`
  - `PillButton`
- 🅰️ Custom fonts integrated via the `Fonts` folder and `Typography.swift`
- 🔍 Modular and scalable MVC structure
- 📖 Developer documentation available within Xcode

---

## 📦 Dependency Integration

### Realm (via Swift Package Manager)

> Realm is only integrated in the `realm` branch

To use Realm:

1. Switch to the Realm branch:
   ```bash
   git checkout realm
2. In Xcode:

 Go to File > Add Packages

Paste the Realm GitHub URL: 

https://github.com/realm/realm-swift

Select the latest version and confirm

3. Realm is now integrated via SwiftPM — no manual framework setup needed.
 ### 🧠 CoreData Integration
🟦 CoreData is integrated in the coredata branch.

To switch to the CoreData version:
```bash
git checkout coredata
```
🔹 Features in CoreData Branch
1. Uses NSManagedObject and .xcdatamodeld file to persist tasks

2. Tasks are saved locally even after app restarts

3. CRUD operations (Create, Read, Update, Delete) are handled using NSFetchRequest and NSPersistentContainer

4. Supports both Light & Dark mode just like the main branch

  
## 🔀 Branches Overview
main	-> Stateless version using basic models

coredata	-> Integrates CoreData for persistence

realm ->	Uses RealmSwift via SPM

## 📂 Project Structure

ToDoList/
├── ViewController/
│   ├── HomeViewController.swift
│   ├── SettingsViewController.swift
│   └── NewTaskViewController.swift
│
├── Components/
│   ├── RoundedButton.swift
│   ├── PillButton.swift
│   └── ShadowButton.swift
│
├── Views/
│   ├── NewTaskModelView.swift
│   ├── TaskModelView.swift
│   └── TaskTableViewCell.swift
│
├── Model/
│   ├── TaskModel.swift
│   └── CategoryModel.swift
│
├── Resources/
│   └── Fonts/
│
├── Design/
│   ├── Typography.swift
│   ├── ColorSet.xcassets
│   └── Animation/
│
├── Assets.xcassets
├── AppDelegate.swift
├── SceneDelegate.swift
└── LaunchScreen.storyboard
## 📸 Screenshots
🌓 Task Views in Light & Dark Mode
	![Light Mode](https://github.com/purnasindhuB/ToDo-List/blob/main/ToDo-List/Screenshots/Screenshot%202025-07-06%20at%203.09.12%20AM.png?raw=true)
 
 ![Dark Mode](https://github.com/purnasindhuB/ToDo-List/blob/main/ToDo-List/Screenshots/Screenshot%202025-07-06%20at%203.09.43%20AM.png?raw=true)

	
## 📚 Developer Documentation
To view documentation inside Xcode:

1. Open the project in Xcode

2. Go to Window > Developer Documentation

3. Search for TaskModel, RoundedButton, or any other module

## 👤 Author

Purnasindhu Bachu
📧 purnasindhubachu@gmail.com
🔗 GitHub Profile
