# # Conditionals: if, else, elsif
# x = 2
# if x == 1
# 	puts 'x = 1'
# elsif x == 2
# 	puts 'x = 2'
# else
# 	puts 'x greater than 2'
# end


# Conditionals: unless, case, ternary operator, or/or-equals(||)
# unless boolean 		# if !boolean
	
# end

# case object			# switch
# when boolean
# 	...
# when boolean
# 	...
# else
# 	...	
# end

# ternary operator
# boolean ? code1: code2
x = 1
puts x == 1 ? 'x = 1' : 'x != 1'	# x = 1


# unless x already have value, otherwise set it to y
# x||= y
# equal to following code 
# unless x
# 	x = y
# end


# # Loop
# Loop do
# 	...
# end
# break = Terminate the whole Loop
# next = jumo to the next Loop
# redo = redo this Loop
# retry = start the whole loop over

x = 0
loop do
	x += 2
	break if x >= 20
	next if x == 6
	print "#{x} "		# 2 4 8 10 12 14 16 18 
end
puts


# while boolean
# 	...
# end
x = 0
while x < 20
	x += 2
	print "#{x} "		# 2 4 6 8 10 12 14 16 18 20 
end
puts


# until  boolean
	# ...	
# end

x = 0
print "#{x+=2} " while x < 20	# 2 4 6 8 10 12 14 16 18 20 
puts ""

x = 0
print "#{x+=2} " until x >= 20	# 2 4 6 8 10 12 14 16 18 20 
puts ""


# Iterators
# also can do break, next, redo, retry in Iterators
# Integers/floats: times, upto, downto, step
# Range: each, step
# String: each, each_line, each_byte
# Array: each, each_index, each_with_index
# Hash: each, each_key, each_value, each_pair

5.times do		# print hello 5 times 
	print "hello "		# hello hello hello hello hello 
end
puts


1.upto(5) { print "world "  }		# world world world world world 
puts
5.downto(1) { print "i "}			# i i i i i 
puts
(1..5).each{print "ruby "}			# ruby ruby ruby ruby ruby 
puts

i = 0
i.upto(20) { print "#{i} "  }		# 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
puts

1.upto(5) do |i|
	print "#{i.to_s} "			# 1 2 3 4 5 
end
puts

fruits = ['banana', 'apple', 'orange']
puts fruits.inspect					# ["banana", "apple", "orange"]
i = 0
fruits.each do |fruit|
	puts "#{i+=1}: #{fruit.capitalize}" 
end
puts

for i in 0..10
	print "#{i} "					# 0 1 2 3 4 5 6 7 8 9 10 
end