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
    puts "Please enter students cohort"
    cohort = gets.chomp
    while cohort.empty? do
      puts "** Please enter students cohort **"
      cohort = gets.chomp
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
  puts "The students of Villians Academy"
  puts "-" * 50
end

def print(students)
  index = 0
  while index < students.length
    puts "#{index+1}.\tName: #{students[index][:name]}\n\tCohort: #{students[index][:cohort]}\n\tCountry of birth: #{students[index][:country]}"
    puts ""
    index += 1
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
