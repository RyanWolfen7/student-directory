# Students
students = [
  "Darth Vader", "Elmo", "The Joker",
  "Thanos", "Lex Luther", "Magneto",
  "Medusa", "Poison Ivy", "Joffrey Baratheon",
  "Negan"
]
# Prints all the Students
def print_names(names)
  names.each do |name|
    puts name
  end
end

# HEADER
def print_header
  puts "The students of Villains Academy"
  puts "--------------------------------"
end

# Print number of students
def print_footer(students)
  puts "--------------------------------"
  puts "Overall, we have #{students.count} great students"
end

# Run Program
print_header
print_names(students)
print_footer(students)
