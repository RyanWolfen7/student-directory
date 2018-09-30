@students = [] # Eptry array for students

# Decoration for the terminal window
def border
  puts "--------------------------------".center(50, "--------")
end

# 10 space buffer
def buffer
  3.times do
    puts
  end
end

# Students Array
def input_students
  border
  puts "Please enter the names of the students".center(50)
  puts "To finish, hit return twice when prompted for a name".center(50)
  border

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
    @students << {name: name, cohort: cohort, hobby: hobby, meathod_of_murder: mom, favorite_color: fc}
    if @students.count == 1
      puts "Now we have #{@students.count} student".center(50)
    else
      puts "Now we have #{@students.count} students".center(50)
    end

    border
    border
    puts
    puts
    puts "Enter a new student or hit return to quit".center(50)
    # get another name
    name = gets.chomp
  end
  # return the array of students
  # students
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
      puts "#{month} Cohort".center(5)
      puts "------------".center(5)
      puts people_by_cohort[month]
      buffer
    end
  end
end

# HEADER
def print_header
  border
  puts "THE STUDENTS OF VILLIANS ACADEMY".center(50)
  border
  buffer
end

# Print number of students
def print_footer(students)
  buffer
  border
  puts "Overall, we have #{students.count} great students".center(50)
  border
end

# Find students by first letter
def find_by_letter(list)
  puts "Enter a letter to search for students that name begins with it".center(50)
  user_input = gets.chomp
  count = 1
  buffer

  # cycles through students to compare first letter with inputed letter
  puts "Here are all the students with names starting with #{user_input}".center(50, " * ")
  border
  buffer
  list.each do |x|
    if x[:name].downcase.start_with?(user_input.downcase)
      puts "#{count}: #{x[:name]} (#{x[:cohort]} cohort)"
      count += 1
    end
  end
  buffer
  border
  buffer
end

# Find by cohort
def find_by_cohort(list)
  puts "Enter a month to find all students in that cohort"
  user_input = gets.chomp
  count = 1
  buffer
  buffer

  puts "#{user_input.capitalize} cohort has these students".center(50)
  border
  # cycles through students and prints out the ones in the Cohort
  list.each do |x|
    if x[:cohort].downcase.eql? user_input.downcase
      puts "#{count}: #{x[:name]}"
      count += 1
    end
  end
  buffer
  border
end

# Find students less then 12 characters long
def find_less_than(list)
  puts "Type a number to find students with names shorter".center(50)
  user_input = gets.chomp
  count = 1
  buffer

  puts "We found these students have less then #{user_input.to_i}".center(50)
  border
  # cycles list for names shorter then user input
  list.each do |x|
    if x[:name].length < user_input.to_i
      puts "#{count}: #{x[:name]} (#{x[:cohort]} cohort)"
      count += 1
    end
  end
  buffer
  border
  buffer
end
# Show STUDENTS
def show_students
  print_header
  print_names(@students)
  print_footer(@students)
  buffer
end

# Saves students to seperate File
def save_students
  puts "Enter the name of the file you wish to save to"
  user_input = gets.chomp

  if File.exists?(user_input)
    puts "#{user_input} found! Loading..."
  else
    puts "#{user_input} not found. Creating file #{user_input}"
  end
  # open student file to write
  file = File.open(user_input, "w")

  # iterate student Array
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:hobby], student[:meathod_of_murder], student[:favorite_color]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
  buffer
  puts "#{@students.length} students saved to #{user_input}"
end

# Loading the STUDENTS
def load_students(filename = "students.csv")
  puts "Enter a file to load from or hit return to load students.csv[Default]"
  user_input = gets.chomp

  if File.exists?(user_input)
    file = File.open(user_input, "r")
  else
    file = File.open("students.csv", "r")
  end

  file.readlines.each do |line|
    name, cohort, hobby, mom, fc = line.chomp.split(',')
    @students << {name: name, cohort: cohort, hobby: hobby, meathod_of_murder: mom, favorite_color: fc}
  end
  file.close

  if @students.length > 0
    puts "#{@students.length} students Succesfully loaded"
  else
    puts "You have failed me for the last time, no students where loaded"
  end
end

# Try to load students contingency
def try_load_students
  filename = ARGV.first # first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

# Finds info on stoodent
def find_student_info(list)
  puts "Enter a student's name to look up thier details"
  user_input = gets.chomp
  buffer

  list.each do |x|
    if x[:name].downcase.eql?  user_input.downcase
      border
      puts "Name:                 #{x[:name]}"
      puts "Cohort:               #{x[:cohort]}"
      puts "Hobby:                #{x[:hobby]}"
      puts "Meathod of Murder:    #{x[:meathod_of_murder]}"
      puts "Favorite Color:       #{x[:favorite_color]}"
      border
      buffer
    end
  end
  buffer
end

# Deletes student
def delete_student(list)
  puts "Enter the name of the student that need ELIMINATING"
  user_input = gets.chomp
  count = 0
  buffer
  puts "Finding target..."

  list.each do |x|
    if x[:name].downcase.eql? user_input.downcase
      puts "Target found..."
      puts "#{x[:name]} Eliminated"
      @students.delete_at(count)
      buffer
    end
    count += 1
  end
  buffer
end

# prints use menu
def print_menu
  # Prints the menue and ask for user input
  border
  puts "Welcome to the Villain Academy Student Directory".center(50)
  puts "Press 1 to input student(s)"
  puts "Press 2 to show the student(s)"
  puts "Press 3 to find students by first letter"
  puts "Press 4 to find students less then a certain length"
  puts "Press 5 to find students by a certain cohort"
  puts "Press 6 to find out a students information"
  puts "Press 7 to load students from File [Default: students.csv]"
  puts "Press 8 to save changes"
  puts "Press 9 to remove a student"  # Remember to impliment this with a def
  puts "Press 10 to reset the student list"
  puts "Press 66 to exit the program"
  border
end

# Interactive menue
def interactive_menu
  loop do
    print_menu
    # reads user input
    selection = gets.chomp.to_i
    # do what the user asks
    case selection
    when 1
      input_students
    when 2
      show_students
    when 3
      find_by_letter(@students)
    when 4
      find_less_than(@students)
    when 5
      find_by_cohort(@students)
    when 6
      find_student_info(@students)
    when 7
      load_students
    when 8
      save_students
    when 9
      delete_student(@students)
    when 10
      @students = [] # Resets the student Array
    when 66
      buffer
      border
      puts "Executing Order 66 my Lord"
      border
      buffer
      exit
    else
      puts "You aren't very bright are you? Try Again"
    end

      # inputs the students
  end
end

try_load_students
interactive_menu
# Run Program -outdated-
# students = input_students
# buffer
# print_header
# print_names(students)
# print_footer(students)
# find_by_letter(students)
# find_less_than(students)
