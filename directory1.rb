#first we print the list of students
def print_header
  puts 'The students of Villians Academy'
  puts '-------------'
end

def print(students)
  #using each with index to iterate over array to display student number
  #print out only student names that begin with T and length is over 12
  students.each_with_index do |student, index|
    if student[:name][0] == "T" && student[:name].length < 12
      puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students =[]
  name = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :november}
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

