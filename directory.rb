# students = [
#   {name: "Dr. Hannibal Lecter", cohort: :november},
#   {name: "Darth Vader", cohort: :november},
#   {name: "Nurse Ratched", cohort: :november},
#   {name: "Michael Corleone", cohort: :november},
#   {name: "Alex Delarge", cohort: :november},
#   {name: "The Wicked Witch Of The West", cohort: :november},
#   {name: "Terminator", cohort: :november},
#   {name: "Freddy Krueger", cohort: :november},
#   {name: "The Joker", cohort: :november},
#   {name: "Joffrey Baratheon", cohort: :november},
#   {name: "Norman Bates", cohort: :november},
# ]

def input_students
  students = []
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
    students << {name: name, cohort: cohort, country: country}
    puts "Now we have #{students.count} students"
    puts "Please enter the next students name"
    name = gets.chomp
  end
  students
end

def print_header
  puts "-" * 50
  puts "The students of Makers Academy".center(50)
  puts "-" * 50
end

def print(students)
  students.each_with_index do |student, index|
    puts "#{index+1}.\tName: #{student[:name]}\n\tCohort: #{student[:cohort]}\n\tCountry of birth: #{student[:country]}"
    puts ""
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
