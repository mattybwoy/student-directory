def print_header
  puts 'The students of Villians Academy'.center(60)
  puts '-------------'.center(60)
end

def print(students)
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
      puts "What cohort will they be joining?"
      cohort = gets.chomp.downcase
        if cohort == ""
        cohort = "November"
        end
    students << {name: name, cohort: cohort, age: :"18", COB: :England}
    puts "Now we have #{students.count} students"
    name = gets.chomp
    if name == "error"
      students.pop
      puts "Please re-enter your name"
      name = gets.chomp
    else !name == "error"
    cohort = gets.chomp
  end
end
students
end
#allows student delete previous entry if they enter error, system will now ask which cohort the student will be joining

# nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)