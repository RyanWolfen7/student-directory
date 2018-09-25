# HEADER
puts "The students of Villains Academy"
puts "--------------------------------"
# Students
students = [
  "Darth Vader", "Elmo", "The Joker",
  "Thanos", "Lex Luther", "Magneto",
  "Medusa", "Poison Ivy", "Joffrey Baratheon",
  "Negan"
]
# Prints all the Students
students.each do |x|
  puts x
end

# Number of Students
student_count = students.length

# Print number of students
puts "--------------------------------"
puts "Overall, we have #{student_count} great students"
