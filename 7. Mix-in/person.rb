load 'contactInfo.rb'

class Person
	include ContactInfo
end

class Teacher
	include ContactInfo
	attr_accessor :lessonPlans
end

class Student < Person
	attr_accessor :books, :grades
end

person1 = Person.new("P-firstname", "P-lastname", "P-city", "P-state", "P-zipcode")
puts person1.fullName()

teacher1 = Teacher.new("T-firstname", "T-lastname", "T-city", "T-state", "T-zipcode")
puts teacher1.fullName()

student1 = Student.new("S-firstname", "S-lastname", "S-city", "S-state", "S-zipcode")
puts student1.fullName()