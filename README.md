<h3 align="center">Fib Test Assesment</h3>

## Get started
This repo contains two folders: iOS and Android.

iOS was built using Xcode 16.2, and supports iOS 18.2, and contain unit tests

Android was build using Android Studio Meerkat Feature Drop | 2024.3.2 Patch 1, and supports Android 15 (API 35)

## App scope

Calculation page:

Presents a view containing a top navigation bar, a text field and a List of items.
The text field should allow only numeric input (0-9).
When the text field returns (user taps Done on the keyboard), take the number the user entered (We'll call it N).
Calculate each value in the Fibonacci sequence F(n) from 1 to N such that F(0) = 0, F(1) = 1, F(2) = 1, F(3) = 2 and so on.
Display each number-value pair computed in the list, one pair per line.
Each line should display its N on the left, left aligned, and its F(N) on the right, right aligned. i.e.  [ N        F(N) ].
Display the total time to calculate all the numbers in milliseconds at the bottom of the page. This should not be part of the scrolling list.
Provide a button on the right side of the navigation bar and call this Summary, and when you tap on the button it takes you to a second page.


Summary page:

The Second page will display a summary of all the calculations from the First page.
It will show a list to display the N and the time it took to do the calculation.
On each line the N will be left justified and the time in milliseconds will be right justified. i.e.  [N ms].
Provide a way to return to the First page in the navigation bar. i.e. a Back button.
The list on the Second page will keep track of ALL calculations from the time the app starts.

## Screenshots

| iOS 1                                   | iOS 2                                                            | iOS 3                                                |
| --------------------------------------- | ---------------------------------------------------------------- | ---------------------------------------------------- |
| ![image1](https://github.com/user-attachments/assets/47275792-112a-489d-9e10-eac2a05d420d) | ![image](https://github.com/user-attachments/assets/556581c9-16f6-4cda-8e55-813f4f8ef810) | ![image](https://github.com/user-attachments/assets/87bc4f7b-ecb7-4782-88a3-2d20c4f50573) |



| Android 1                                   | Android 2                                                            | Android 3                                                |
| --------------------------------------- | ---------------------------------------------------------------- | ---------------------------------------------------- |
| ![Screenshot 2025-06-24 at 18 11 26](https://github.com/user-attachments/assets/114753f3-8bbd-4e19-96d1-a05e7dbbac6f) | ![Screenshot 2025-06-24 at 18 11 40](https://github.com/user-attachments/assets/3d6df893-d534-4cff-8714-26d6933cd0a2) | ![Screenshot 2025-06-24 at 18 13 07](https://github.com/user-attachments/assets/163d680e-456e-4956-8c72-e7c9e89e32c9) |






