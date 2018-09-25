# Students
students = [
  {name: "Darth Vader", cohort: :october},
  {name: "Elmo", cohort: :october},
  {name: "The Joker", cohort: :october},
  {name: "Thanos", cohort: :october},
  {name: "Lex Luther", cohort: :october},
  {name: "Magneto", cohort: :october},
  {name: "Medusa", cohort: :october},
  {name: "Poison Ivy", cohort: :october},
  {name: "Joffrey Baratheon", cohort: :october},
  {name: "Negan", cohort: :october}
]
# Prints all the Students
def print_names(names)
  names.each do |name|
    puts "#{name[:name]} (#{name[:cohort]} cohort)"
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
