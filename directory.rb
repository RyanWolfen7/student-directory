# Students Array
def input_students
  puts "--------------------------------------"
  puts "Please enter the names of the students"
  puts "To finish, hit return twice"
  puts "--------------------------------------"

  students = []
  # gets the first name
  name = gets.chomp
  # while name is not empty continue names
  while !name.empty? do
    # add the student has to  Array
    students << {name: name, cohort: :october}
    puts "Now we have #{students.count} students"
    # get another name
    name = gets.chomp
  end
  # return the array of students
  students
end

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
students = input_students
print_header
print_names(students)
print_footer(students)
