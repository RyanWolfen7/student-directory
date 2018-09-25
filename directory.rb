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

# Print number of students
puts "--------------------------------"
puts "Overall, we have #{students.count} great students"
