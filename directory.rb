@students = [] #empty array accessible to all methods

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save file"
  puts "4. Load file"
  puts "9. Exit"
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection  
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
      puts "File saved"
    when "4"
      user_load
      puts "File loaded"
    when "9"
      exit
    else
      puts " I don't know what you meant, try again"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
  puts "Please enter cohort"
  cohort = STDIN.gets.chomp
  while !name.empty? do
    student_list(name, cohort)
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp
    cohort = STDIN.gets.chomp
  end
end

def student_list(name, cohort) 
  @students << {name: name, cohort: cohort.to_sym}
end
#DRY repeated code put into method

def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  puts 'The students of Villians Academy'
  puts '-------------'
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students
  puts "Enter file name"
  filename = gets.chomp + ".csv"
  file = File.open(filename, "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close  
end
#modified file name for saving
def user_load
  puts "Enter file name"
  load_students(gets.chomp)
end
#loading specific file 

def load_students(filename)
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    student_list(name, cohort)
  end
  file.close
end
#modified file name for loading

def try_load_students
  ARGV.first.nil? ? filename = "students.csv" : filename = ARGV.first
  #deafult file loaded if no file name given
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "sorry that file doesn't exist"
    exit
  end
end
# nothing happens until we call the methods

try_load_students
interactive_menu

