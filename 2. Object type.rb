
# everythign in ruby are objectm except those variable
x = 1
puts x + 2

# variables: Scope indicators
# Global		$variable
# class		@@variable
# instance	@variable
# Local		variable
# block		variable


# Integer
x = 10
puts 'x = 10'									# x = 10
puts "5 + 2 = #{5+2}"							# 5 + 2 = 7
puts "5 - 2 = #{5-2}"							# 5 - 2 = 3
puts "5 * 2 = #{5*2}"							# 5 * 2 = 10
puts "5 / 2 = #{5/2}"							# 5 / 2 = 2
puts "5 ** 2 = #{5**2}"							# 5 ** 2 = 25
puts "x += 2 = #{x+=2}"							# x += 2 = 12
puts "x = 10, x.class: #{x.class}"				# x = 10, x.class: Integer
x = 123.4
puts "x = 123.4, x.class: #{x.class}"			# x = 123.4, x.class: Float
x = 1234567890000
puts "x = 1234567890000, x.class: #{x.class}"	# x = 1234567890000, x.class: Integer

x = -1
puts "x: #{x}"				# x: -1
puts "x.abs: #{x.abs}"		# x.abs: 1
puts "x.next: #{x.next}"	# x.next: 0


#Floats
x = 1.234
y = 10
z = x + y
puts "x: #{x}, y: #{y}, z: #{z}"					# x: 1.234, y: 10, z: 11.234
puts "x: #{x}, x.class: #{x.class}"					# x: 1.234, x.class: Float
puts "y: #{y}, y.class: #{y.class}"					# y: 10, y.class: Integer
puts "z: #{z}, z.class: #{z.class}"					# z: 11.234, z.class: Float
puts "x+1: #{x+1}"									# x+1: 2.234
puts "y+1: #{y+1}"									# y+1: 11
puts "10/3: #{10/3}"								# 10/3: 3
puts "10.0/3: #{10.0/3}"							# 10.0/3: 3.3333333333333335
puts "10/3.0: #{10/3.0}"							# 10/3.0: 3.3333333333333335
puts "rounding number, 1.23.round: #{1.23.round}"	# rounding number, 1.23.round: 1
puts "to Integer number, 1.23.to_i: #{1.23.to_i}"	# to Integer number, 1.23.to_i: 1
puts "floor method, 1.23.floor: #{1.23.floor}"		# floor method, 1.23.floor: 1
puts "ceil method, 1.23.floor: #{1.23.ceil}"		# ceil method, 1.23.floor: 2




# String
a = 'hello'
b = 'world'
puts a + ' ' + b + '!!'		# hello world!!
puts '1*5: ' + '1'*5		# 1*5: 11111
puts 'I\'m the best'		# I'm the best
# different between double quto and single quto, check output
puts "\"\\ta\\tb\\nc\\nd\": " + "\ta\tb\nc\nd"
puts '\'\\ta\\tb\\nc\\nd\': ' + '\ta\tb\nc\nd'
puts "#{a} #{b}"		# hello world
puts '#{a} #{b}'		# #{a} #{b}
puts "hello.reverse: #{'hello'.reverse}"		# hello.reverse: olleh
puts "hello.capitalize: #{'hello'.capitalize}"	# hello.capitalize: Hello
puts "hello.downcase: #{'hello'.downcase}"		# hello.downcase: hello
puts "hello.upcase: #{'hello'.upcase}"			# hello.upcase: HELLO
puts "hello.capitalize: #{'hello'.capitalize}"	# hello.capitalize: Hello
puts "hello".length			# 5


# Array
# any object can go into the array, string, numbers, other arrays, mixed types
data = ["a", 'b', 123]
puts data[0]	# a
puts data[4]	# nil (nothing)
data[1] = "hello"
data[4] = 99
puts "#{data[1]}, #{data[4]}"	# hello, 99
puts data.inspect	# ["a", "hello", 123, nil, 99]
data << 'last'		# insert the element to the last element of the array
puts data.inspect	# ["a", "hello", 123, nil, 99, "last"]
data[1] = nil		# set the second element to nothing
puts data.inspect	# ["a", nil, 123, nil, 99, "last"]
data.clear			# clear the entire array
puts data.inspect	# []
puts data.class		# Array
data = nil
puts data.class		# NilClass



# array methods
array1 = [1, 2, 3, 4, 3]
array2 = [1, 'hello', 3.0, "world", ['a', 'b']]
puts array1.inspect		# display array1
puts array2.to_s		# display array2
puts array2				# display array element in row
x = array1.join(", ")	# 1, 2, 3, 4
puts x 						# 1, 2, 3, 4, 3
x_Array = x.split(', ')
puts x_Array.inspect		# ["1", "2", "3", "4", "3"]
x_Array = x_Array.reverse
puts x_Array.inspect		# ["3", "4", "3", "2", "1"]
array1 << -1
puts array1.inspect			# [1, 2, 3, 4, 3, -1]
sortArray = array1.sort
puts sortArray.inspect		# [-1, 1, 2, 3, 3, 4]
uniqArray = array1.uniq
puts uniqArray.inspect		# [1, 2, 3, 4, -1]

# delate index element
puts array1.inspect			# [1, 2, 3, 4, 3, -1]
array1.delete_at(0)			# delete the frist index of the array, and shift 1 index forward
puts array1.inspect			# [2, 3, 4, 3, -1]
array1 << 10				
puts array1.inspect			# [2, 3, 4, 3, -1, 10]
array1.push(20)			#insert 20 to the last element
puts array1.inspect			# [2, 3, 4, 3, -1, 10, 20]
array1.pop				# remove the last element
puts array1.inspect			# [2, 3, 4, 3, -1, 10]
array1.unshift(99)		# insert 99 in the first element
puts array1.inspect			# [1, 2, 3, 4, 3, -1, 10]
array1 += [100,200]
puts array1.inspect			# [99, 2, 3, 4, 3, -1, 10, 100, 200]
array1 -= [100,200]
puts array1.inspect			# [99, 2, 3, 4, 3, -1, 10]