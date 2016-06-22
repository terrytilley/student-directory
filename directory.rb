@students = []

def input_students
  puts "** To finish, just hit return twice **"
  puts "Please enter the names of the students"
  name = gets.chomp
  while !name.empty? do
    puts "Is \"#{name}\" correct? (y/n) "
    spell = gets.chomp.downcase
    while spell == "n"
      puts "Please re-enter the name"
      name = gets.chomp
      puts "Is \"#{name}\" correct? (y/n) "
      spell = gets.chomp.downcase
    end
    puts "Please enter students cohort"
    cohort = gets.chomp
    if cohort.empty?
      cohort = "Unknown".to_sym
    end
    puts "Please enter students birth country"
    country = gets.chomp
    while country.empty? do
      puts "** Please enter students birth country **"
      country = gets.chomp
    end
    @students << {name: name, cohort: cohort, country: country}
    if @students.length < 2
      puts "Now we have #{@students.count} student"
    else
      puts "Now we have #{@students.count} students"
    end
    puts "Please enter the next students name"
    name = gets.chomp
  end
  if @students.length < 1
    puts "-" * 50
    puts "** No students where entered **".center(50)
    puts "-" * 50
    puts ""
    exit
  end
end

def print_header
  puts "-" * 50
  puts "The students of Makers Academy".center(50)
  puts "-" * 50
end

def print_names
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
  puts "-" * 25
  puts "Overall, we have #{@students.count} great students"
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def show_students
  print_header
  print_names
  print_footer
end

def interactive_menu
  loop do
    print_menu
    selection = gets.chomp
    case selection
    when "1"
      input_students
    when "2"
      show_students()
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
    end
  end
end

interactive_menu
