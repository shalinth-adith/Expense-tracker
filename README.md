#  MoneyMap — SwiftUI Expense Tracker App

MoneyMap is a clean, modern expense tracking app built using **SwiftUI (iOS 17)** and **Swift 5.9**. Designed for simplicity and clarity, it helps users manage personal and business expenses in a beautifully themed interface.

---

##  Features

- Add and delete expenses with category and amount
-  Automatically calculates total expenses (live updating)
-  Categorize expenses as Personal or Business
-  Segmented filter for type-based viewing
-  Date picker for tracking expense dates
-  Full theming with custom colors, shadows, and rounded cards
-  Persistent state using SwiftUI's latest data-binding system (`@Observable`, `@Bindable`)
-  Clean, responsive UI with SwiftUI `List`, `Form`, and `NavigationStack`

---


##  Tech Stack

- **Swift 5.9**
- **SwiftUI (iOS 17)**
- `@Observable` & `@Bindable` (new state model)
- `NavigationStack`
- `.sheet()`, `.toolbar()`, `.safeAreaInset()`
- `Assets.xcassets` for dark/light mode theming

---

##  Project Structure


MoneyMap/
├── Models/
│   ├── ExpenseItem.swift
│   └── Expenses.swift
├── Views/
│   ├── ContentView.swift
│   └── AddView.swift
├── Modifiers/
│   ├── CardStyle.swift
│   └── Font+Theme.swift
├── Assets.xcassets/
└── README.md

## Requirements

Xcode 15+
iOS 17+ Simulator or real device
Swift 5.9 or later

## What You’ll Learn (if you're a student/dev)

- Building multi-screen SwiftUI apps with NavigationStack
- Passing data between views with @Bindable
- Building a dynamic List with live total tracking
- Using SwiftUI Form, Picker, TextField
- Creating a full visual theme in SwiftUI
- Working with @Observable data flow (the modern SwiftUI approach

## Future Plans

- Add charts with Swift Charts
- Export expenses to CSV
- Set monthly budget and track remaining
- iCloud sync with CloudKit
- Add Face ID/Touch ID lock



