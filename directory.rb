def interactive_menu
  loop do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    selection = gets.chomp
    case selection
    when "1"
      students = input_students
    when "2"
      print_header
      print(students)
      print_footer(students)
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
    end
  end
end

def input_students
  students = []
  puts "** To finish, just hit return twice **"
  puts "Please enter the names of the students"
  name = gets.delete("\n")
  while !name.empty? do
    puts "Is \"#{name}\" correct? (y/n) "
    spell = gets.delete("\n").downcase
    while spell == "n"
      puts "Please re-enter the name"
      name = gets.delete("\n")
      puts "Is \"#{name}\" correct? (y/n) "
      spell = gets.delete("\n").downcase
    end
    puts "Please enter students cohort"
    cohort = gets.delete("\n")
    if cohort.empty?
      cohort = "Unknown".to_sym
    end
    puts "Please enter students birth country"
    country = gets.delete("\n")
    while country.empty? do
      puts "** Please enter students birth country **"
      country = gets.delete("\n")
    end
    students << {name: name, cohort: cohort, country: country}
    if students.length < 2
      puts "Now we have #{students.count} student"
    else
      puts "Now we have #{students.count} students"
    end
    puts "Please enter the next students name"
    name = gets.delete("\n")
  end
  if students.length < 1
    puts "-" * 50
    puts "** No students where entered **".center(50)
    puts "-" * 50
    puts ""
    exit
  else
    students
  end
end

def print_header
  puts "-" * 50
  puts "The students of Makers Academy".center(50)
  puts "-" * 50
end

def print(students)
  cohort_sorted = students.group_by { |e| e[:cohort] }
  cohort_sorted.each do |k,v|
    puts "-" * 25
    puts "Cohort #{k}"
    puts "-" * 25
    v.each do |student|
      puts "Name: #{student[:name]}\nCountry of birth: #{student[:country]}"
      puts ""
    end
  end
end

def print_footer(names)
  puts "-" * 25
  puts "Overall, we have #{names.count} great students"
end

interactive_menu
