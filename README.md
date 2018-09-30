# Student Directory #

This directory script allows us to keep track of Villains Academy.

## How to use ##

### How to initialize Program ###
ruby directory.rb + File extension **OR** ruby directory.rb

*while if can be run with terminal extension files it is not necessary. A student file will be loaded by default*

### Contains 9 options on run ###

####1: Input Student(s)####
  - Asks user for student name (in full)
  - Asks user for cohort date  [Default: UKN]
  - Asks user for student hobby [Default: UKN]
  - Asks user for student Meathod of Murder [Default: UKN]
  - Asks user for student favorite color [Default: UKN]
  - *Displays that a student has been added*
####2: Show students####
  - Displays Students By cohort date
    *If there are no students in the cohort date the cohort date will not be displayed*
  - Tells you how many students the course has
####3: Find Students by first letter####
  - Scans student array for first letter matches user input *NOTE: user is able to input more then one character*
  - Prints out number list of every student that matches the criteria and their cohort date
####4: Find students less then certain length####
  - Scans students with names less then the length of the user input
  - Displays the students and cohort date
####5: Find students from certain cohort####
  - When user inputs a month it displays all students in that month
####6: Find Student information####
  - Finds user inputed student *must be spelled correctly, but case insensitive*
  - Displays the Student Name/Cohort/Hobby/MOM/Favorite Color
####7: Load file####
  - Prompts for a file to be loaded
  - If user input can not be found defaults to students.csv
  - If multiple files are loaded one after the other the students array does not automatically reset *to reset see option 10*
####8: Save file####
  - Prompts user for save file name
  - If the file does not exist displays that it is creating the file
  - If the file does exist displays that it is updating the file
####9: Delete student####
  - Finds student matching user input
  - If no student is match displays error message
  - Deletes the student
####10: Clear Students####
  - Resets the student array
####66: Quits program####
  - displays "Executing Order 66 my Lord"
