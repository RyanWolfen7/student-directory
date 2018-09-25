# Decoration for the terminal window
def border
  puts "--------------------------------".center(50, "--------")
end

# 10 space buffer
def buffer
  10.times do
    puts
  end
end

# Students Array
def input_students
  border
  puts "Please enter the names of the students".center(50)
  puts "To finish, hit return twice when prompted for a name".center(50)
  border

  students = []
  # gets the name
  name = gets.chomp
  # while name is not empty continue names
  while !name.empty? do
    # add cohort
    puts "Cohort date? Enter a number (1-12)"
    cohort = gets.chomp.to_i
    case cohort
    when 1
      cohort = "January"
    when 2
      cohort = "Feburary"
    when 3
      cohort = "March"
    when 4
      cohort = "April"
    when 5
      cohort = "May"
    when 6
      cohort = "June"
    when 7
      cohort = "July"
    when 8
      cohort = "August"
    when 9
      cohort = "September"
    when 10
      cohort = "October"
    when 11
      cohort = "November"
    when 12
      cohort = "December"
    else
      cohort = "UNK"
    end

    # add bio
    puts "Hobby?"
    hobby = gets.chomp
    puts "Meathod of Murder"
    mom = gets.chomp
    puts "Favorite color?"
    fc = gets.chomp

    # if these are skipped enter unk
    if hobby == ""
       hobby = "UNK"
     end
    if mom == ""
       mom = "UNK"
     end
    if fc == ""
       fc = "UNK"
     end


    # add the student to  Array
    students << {name: name, cohort: cohort, hobby: hobby, meathod_of_murder: mom, favorite_color: fc}
    puts "Now we have #{students.count} students".center(50)
    border
    border
    puts
    puts
    puts "Enter a new student or hit return to quit".center(50)
    # get another name
    name = gets.chomp
  end
  # return the array of students
  students
end

# Prints all the Students
def print_names(names)
  # checks if the list is empty
  if !names.empty?
    count = 1
  end
  # new hash of people by cohort
  people_by_cohort = {}

# Old method left for testing
#  names.each do |name|
#    puts "#{count}: #{name[:name]} (#{name[:cohort]} cohort)"
#    count += 1
#  end

  #sorts through people and assignes them by Cohort to people_by_cohort
  names.each do |person|
    cohort = person[:cohort]
    name = person[:name]

    if people_by_cohort[cohort] == nil
      people_by_cohort[cohort] = []
    end

    people_by_cohort[cohort].push(name)
  end

  # Array of months to sort the list
  months = [
    "January", "Feburary", "March", "April", "May",
    "June", "July", "August", "September", "October",
    "November", "December"
  ]

  # For testing purposes
  # puts people_by_cohort["June"]

  months.each do |month|
    if people_by_cohort.include? month
      puts "#{month} Cohort".center(50)
      border
      puts people_by_cohort[month]
    end
  end
end

# HEADER
def print_header
  border
  puts "THE STUDENTS OF VILLIANS ACADEMY".center(50)
  border
end

# Print number of students
def print_footer(students)
  border
  puts "Overall, we have #{students.count} great students".center(50)
  border
end

# Find students by first letter
def find_by_letter(list)
  puts "Enter a letter to search for students that name begins with it".center(50)
  user_input = gets.chomp
  count = 1

  # cycles through students to compare first letter with inputed letter
  puts "Here are all the students with names starting with #{user_input}".center(50, " * ")
  border
  list.each do |x|
    if x[:name].downcase.start_with?(user_input.downcase)
      puts "#{count}: #{x[:name]} (#{x[:cohort]} cohort)"
      count += 1
    end
  end
  border
end

# Find students less then 12 characters long
def find_less_than(list)
  puts "Type a number to find students with names shorter".center(50)
  user_input = gets.chomp
  count = 1

  puts "We found these students have less then #{user_input.to_i}".center(50)
  border
  # cycles list for names shorter then user input
  list.each do |x|
    if x[:name].length < user_input.to_i
      puts "#{count}: #{x[:name]} (#{x[:cohort]} cohort)"
      count += 1
    end
  end
  border
end

# Run Program
students = input_students
buffer
print_header
print_names(students)
print_footer(students)
find_by_letter(students)
find_less_than(students)
