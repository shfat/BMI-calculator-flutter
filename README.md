# 🧮 BMI Calculator App (Flutter)

A clean and interactive **BMI (Body Mass Index) Calculator mobile application** built with Flutter.  
The app allows users to input gender, height, weight, and age, then calculates their BMI and provides categorized health feedback with a modern and responsive UI experience.

---

## ✨ Features

- 🎯 Calculate BMI based on height and weight
- 👤 Gender selection (Male / Female UI state)
- 📏 Adjustable height slider (100cm – 260cm)
- ⚖️ Increment/decrement controls for weight and age
- ⏱️ Long-press auto-repeat functionality for increment/decrement buttons  
  (Improves UX when adjusting values like weight and age)
- 📊 Instant BMI result with category classification
- 🎨 Color-coded health status (Normal / Overweight / Obese / Underweight)
- 💬 Personalized interpretation messages
- 🚫 Input rate-limiting to prevent SnackBar spam
- 🧩 Fully reusable UI components
- 🌙 Dark-themed modern UI design

---

## 🧠 App Logic

The BMI calculation follows the standard formula:

> BMI = weight (kg) / height² (m²)

The app classifies results into:

- Underweight
- Normal weight
- Overweight
- Obese Class I
- Obese Class II
- Obese Class III

Each category includes:
- A label
- A color indicator
- A health interpretation message

---

## 🚀 Key UX Improvements

- Prevented repeated SnackBar spam using time-based throttling
- Implemented long-press gesture detection for smoother value adjustment
- Enhanced user interaction flow for faster input handling
- Improved feedback clarity for invalid input ranges

---

## 🏗️ Project Structure

```
lib/
├── components/
│   ├── icon_content.dart
│   ├── large_button.dart
│   ├── reusable_card.dart
│   └── round_icon_button.dart
├── screens/
│   ├── input_page.dart
│   └── results_page.dart
├── BMI_calculate_brain.dart
├── constants.dart
└── main.dart
```

---

## 🧩 Architecture Overview

This project follows a simple but clean separation of concerns:

- **UI Layer (Screens)** → Input & Result pages
- **Reusable Components** → Buttons, Cards, Icons
- **Business Logic Layer** → BMI calculation engine
- **Constants File** → Centralized design system (colors, styles, sizes)

---

## 🎯 What I Learned

- Flutter state management using `setState`
- UI composition with reusable widgets
- Gesture handling (tap + long press interactions)
- Navigation between screens
- Handling edge cases in user input
- Preventing UI spam and improving UX responsiveness
- Clean code structure and separation of concerns

---

## 🔧 Tech Stack

- Flutter
- Dart
- Material Design
- Font Awesome Icons

---
