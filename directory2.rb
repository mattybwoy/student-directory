def print_header
  #centering the headers and output information
  puts 'The students of Villians Academy'.center(60)
  puts '-------------'.center(60)
end

def print(students)
   #rewrite each method into while loop and hardcoded students age and COB
  x = 0
  while x <= students.length - 1 do
    puts "#{x + 1}. #{students[x][:name]} (#{students[x][:cohort]} cohort) Age (#{students[x][:age]}) Country of Birth (#{students[x][:COB]})"
    x += 1
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(60)
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students =[]
  name = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :November, age: :"18", COB: :England}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end

# nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
