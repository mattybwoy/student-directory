def print_header
  puts 'The students of Villians Academy'.center(60)
  puts '-------------'.center(60)
end

def print(students)
  puts "which cohort would you like to select?"
  selection = gets.chop
  puts students.select{|k,_v| k[:cohort]== selection}
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(60)
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students =[]
  name = gets.chop
  while !name.empty? do 
      puts "What cohort will they be joining?"
      cohort = gets.chop
        if cohort == ""
        cohort = "November"
        end
    students << {name: name, cohort: cohort, age: :"18", COB: :England}
    if students.count > 1
    puts "Now we have #{students.count} students"
    else students.count == 1
      puts "Now we have #{students.count} student"
    end
    #Modified students count to be singular if student count is 1
    name = gets.chop
    if name == "error"
      students.pop
      puts "Please re-enter your name"
      name = gets.chop
    else !name == "error"
    cohort = gets.chop
  end
end
students
end
#changed chomp to chop as alternative method

# nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)