@students = []

def interactive_menu
  loop do
    # 1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    # 2. read the input and put it into a variable
    selection = gets.chomp
    # 3. do what the user has asked
    case selection
    when "1"
      students = input_students
      #input the students
    when "2"
      print_header
      print(students)
      print_footer(students)
      #show the students
    when "9"
      exit #this will cause the program to terminate
    else
      puts " I don't know what you meant, try again"
  end
end
end

def print_header
  puts 'The students of Villians Academy'
  puts '-------------'
end

def print(students)
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
  puts "Overall, we have #{@students.count} great students"
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = gets.chomp
  
  while !name.empty? do
    @students<< {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    name = gets.chomp
  end
  @students
end

# nothing happens until we call the methods
interactive_menu

