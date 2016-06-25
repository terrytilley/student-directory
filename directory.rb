require "csv"

@students = []
@filename = "students.csv"

def input_students
  name = get_name
  while !name.empty? do
    name = name_spell_check(name)
    cohort = get_cohort
    country = get_country
    @students << {name: name, cohort: cohort, country: country}
    if @students.length < 2
      puts "Now we have #{@students.count} student"
    else
      puts "Now we have #{@students.count} students"
    end
    puts "Please enter the next students name"
    name = STDIN.gets.chomp
  end
  no_students
end

def get_name
  puts "** To finish, just hit return twice **"
  puts "Please enter the names of the students"
  name = STDIN.gets.chomp
end

def name_spell_check(name)
  puts "Is \"#{name}\" correct? (y/n) "
  spell = STDIN.gets.chomp.downcase
  while spell == "n"
    puts "Please re-enter the name"
    name = STDIN.gets.chomp
    puts "Is \"#{name}\" correct? (y/n) "
    spell = STDIN.gets.chomp.downcase
  end
  name
end

def no_students
  if @students.length < 1
    puts "-" * 50
    puts "** No students where entered **".center(50)
    puts "-" * 50
    puts ""
    exit
  end
end

def get_cohort
  puts "Please enter students cohort"
  cohort = STDIN.gets.chomp
  if cohort.empty?
    cohort = "Unknown".to_sym
  end
  cohort
end

def get_country
  puts "Please enter students birth country"
  country = STDIN.gets.chomp
  while country.empty? do
    puts "** Please enter students birth country **"
    country = STDIN.gets.chomp
  end
  country
end

def print_header
  puts "-" * 50
  puts "The students of Makers Academy".center(50)
  puts "-" * 50
end

def print_students_list
  cohort_sorted = @students.group_by { |e| e[:cohort] }
  cohort_sorted.each do |k,v|
    puts "-" * 25
    puts "Cohort: #{k}"
    puts "-" * 25
    v.each do |student|
      puts "Name: #{student[:name]}\nCountry of birth: #{student[:country]}"
      puts ""
    end
  end
end

def print_footer
  puts "-" * 50
  puts "Overall, we have #{@students.count} great students"
  puts "-" * 50
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list"
  puts "4. Load the list"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    feedback_message("(1) Input the students")
    input_students
  when "2"
    feedback_message("(2) Show the students")
    show_students
  when "3"
    feedback_message("(3) Save the list")
    save_students
  when "4"
    feedback_message("(4) Load the list")
    load_students
  when "9"
    feedback_message("(9) Exit")
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

def feedback_message(menu_num)
  puts "*"*25
  puts "Menu \"#{menu_num}\" selected".center(25)
  puts "*"*25
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def set_file_name
  puts "Enter file name:"
  @filename = STDIN.gets.chomp + ".csv"
end

def save_students
  CSV.open(set_file_name, "w") do |csv|
    @students.each do |student|
      csv << [student[:name], student[:cohort], student[:country]]
    end
  end
end

def load_students(filename = set_file_name)
  CSV.foreach(filename, "r") do |row|
    name, cohort, country = row
    @students << {name: name, cohort: cohort.to_sym, country: country}
  end
end

def try_load_students
  filename = ARGV.first
  return load_students(@filename) if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exists."
    exit
  end
end

try_load_students
interactive_menu
