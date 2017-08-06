# defining and calling methods

# Gobal		$variable		available for method
# Class		@@variable		available for method
# Instance	@variable		available for method
# Local		variable		inside the method
# Block		variable		inside the method
# def someName
# 	...
# end
def hello
	puts 'hello world'
end
hello

def longestWordMethod1
	words = ['apple', 'pear', 'banana', 'orange']
	longestWord = words.inject do |memo, word|
		memo.length > word.length ? memo : word
	end
	puts longestWord
end

# using outside variable of the method
@words = ['apple', 'pear', 'banana', 'orange']
def longestWordMethod2
	longestWord = @words.inject do |memo, word|
		memo.length > word.length ? memo : word
	end
	puts longestWord
end

longestWordMethod1
longestWordMethod2



# arguments - args
def welcome(name)
	puts "Hello #{name}, Welcom to Ruby"
end
name = 'Tim'
welcome(name)
welcome('Jack')
welcome 'Anna'

def addition(num1, num2)
	puts "#{num1} + #{num2} = #{num1 + num2}"
end
addition(1, 2)



# argument default value
def group1(p1, p2)
	puts "#{p1} and #{p2} in a group"
end
def group2(p1, p2 = 'null')
	puts "#{p1} and #{p2} in a group"
end
def group3(p1 = 'null', p2)
	puts "#{p1} and #{p2} in a group"
end
def group4(p1 = 'null', p2 = 'null')
	puts "#{p1} and #{p2} in a group"
end
person1, person2 = 'Tim', 'Jack'
group1(person1,person2)			# Tim and Jack in a group
group2(person1)					# Tim and null in a group
group3(person2)					# null and Jack in a group

group4()						# null and null in a group
group4(person1)					# Tim and null in a group
group4(person2)					# Jack and null in a group
group4(person1,person2)			# Tim and Jack in a group



# Return Value
def addition1(num1, num2)
	print "addition1 gets call: "
	return num1 + num2
end

num1, num2 = 2, 3
puts "#{num1} + #{num2} = #{addition1(num1, num2)}"		# addition1 gets call: 2 + 3 = 5

def addAndSubtract(num1, num2)
	puts "addAndSubtract gets call: "
	addition = num1 + num2
	subtract = num1 - num2
	return [addition, subtract]
end
result = addAndSubtract(num1, num2)
add, sub = addAndSubtract(num1, num2)		# double assignment
puts "#{num1} + #{num2} = #{result[0]}"
puts "#{num1} - #{num2} = #{result[1]}"
puts "#{num1} + #{num2} = #{add}"
puts "#{num1} - #{num2} = #{sub}"

