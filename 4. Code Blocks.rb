# code block - block of code of each loop

# 5.times do
# 	print 'hello '
# end
# puts
# 5.times {print "world "}
# puts

# 1.upto(5) do |i|
# 	print "Hello " + i.to_s + ' '
# end

nums = [1,2,3,4,5]
# 1.upto(nums.length) do |i|
# 	print i.to_s + ' '
# end
# puts
# nums.each {|num| print ((num * 20).to_s + " ")}
# num = 1
# nums.each {|num| print ((num * 20) + 1)}
# puts
# puts num

# # common Ruby method - find, merge, collect, sort, inject
# # find - first 4 method are work on range() and the last one works on array[]

# # find/detect => Object or nil
# # return if ruby found the element meets the conditio
# puts (1..10).find{|i|  i == 5}			# 5
# puts (1..10).find{|i|  i % 3== 0}		# 3
# puts (1..10).detect{|i|  i % 3== 0}		# 3
# puts (1..10).detect{|i|  (1..10).include?(i * 3)}	# 1
# puts (1..10).detect{|i|  i == 20}			# nil

# # find_all/select => Array
# # will return result as array
# print (1..10).find_all{|i|  i % 3== 0}		# [3, 6, 9]
# puts
# print (1..10).find_all{|i|  i == 2}		# [2]
# puts

# # any? => Boolean
# # does any element match in the set and return the boolean
# print (1..10).any?{|i| i== 5}		# true
# puts

# # all? => Boolean
# # does all the elements in the array meet the condition
# print (1..10).all?{|i| i== 5}		# false
# puts

# # delete_if => Array
# # only works on array, finds all the element meets the condition and delete them, then return
# print [*1..10].delete_if {|i| i % 3 == 0 }		# [1, 2, 4, 5, 7, 8, 10]
# puts



# # merge
# hash1 = {'a' => 111, 'b' => 222}
# hash2 = {'b' => 333, 'c' => 444}
# # in the following code the value of hash1 and hash2 will change after each merge
# puts hash1.merge(hash2)		# {"a"=>111, "b"=>333, "c"=>444}
# puts hash2.merge(hash1)		# {"b"=>222, "c"=>444, "a"=>111}
# puts hash2.merge(hash1)	{|key, old, new| new}	# {"b"=>222, "c"=>444, "a"=>111}
# puts hash2.merge(hash1)	{|key, old, new| old}	# {"b"=>333, "c"=>444, "a"=>111}
# puts hash2.merge(hash1)	{|key, old, new| old * 5}	# {"b"=>1665, "c"=>444, "a"=>111}
# puts hash1.merge(hash2) {|k, o, n| o < n ? o : n}	# {"a"=>111, "b"=>222, "c"=>444}
# hash1 = {'a' => 111, 'b' => 222}
# hash2 = {'b' => 333, 'c' => 444}
# hash1.merge!(hash2)		
# puts hash1				# {"a"=>111, "b"=>333, "c"=>444}
# puts hash2				# {"b"=>333, "c"=>444}



# # collect / map - works in arrays, hashes, and ranges
# # always return result as array, no matter data goin as array, hash, or range, it will always outcome as array
# # number of items in = number of items out, will fill up with nil
# array = [1,2,3,4,5]
# # excute every elements in the array into the local variable and do something
# puts array.collect { |i| i + 1 }.inspect	# [2, 3, 4, 5, 6]
# puts array.inspect							# [1, 2, 3, 4, 5]
# fruits = ['apple', 'banana', 'orange']		
# puts fruits.map {|fruit| fruit.capitalize}.inspect		# ["Apple", "Banana", "Orange"]
# # following code will check is the element is equal the the condition, otherwise will return nil
# puts fruits.map {|fruit| fruit.capitalize if fruit == 'banana'}.inspect		# [nil, "Banana", nil]
# # following code will do what i expect on the last code statement
# puts fruits.map { |fruit| fruit == 'banana' ? fruit.capitalize : fruit}.inspect		# ["apple", "Banana", "orange"]
# # return [nil, nil, nil], because put/print statement will return nil
# puts fruits.map {|fruit| puts fruit.capitalize}.inspect		# [nil, nil, nil]
# # fruits never change values
# puts fruits.inspect			# ["apple", "banana", "orange"]


# Sort - 
# <=> - Spaceship operator
# value1 <=> value2
# -1 -> Less than
# 0 -> Equal
# 1 -> More than
puts 1 <=> 2	# -1
puts 2 <=> 1	# 1
puts 1 <=> 1	# 0

array = [3,2,4,1,5]
puts array.sort.inspect		# [1, 2, 3, 4, 5]
puts array.sort.reverse.inspect		# [5, 4, 3, 2, 1]
# the following 2 statement have more easier way to do it, but by doing so it can do more complex operation
puts array.sort { |a, b| a <=> b }.inspect		# [1, 2, 3, 4, 5]
puts array.sort { |a, b| b <=> a }.inspect		# [5, 4, 3, 2, 1]
puts array.inspect			# [3, 2, 4, 1, 5]
fruits = ['apple','pear', 'banana', 'orange']
puts fruits.sort.inspect	# ["apple", "banana", "orange", "pear"]
# sort string array by length
puts fruits.sort {|fruit1, fruit2| fruit1.length <=> fruit2.length}.inspect		# ["pear", "apple", "orange", "banana"]
puts fruits.sort {|fruit1, fruit2| fruit2.length <=> fruit1.length}.inspect		# ["pear", "apple", "orange", "banana"]
puts fruits.sort_by{|fruit| fruit.length}.inspect		# ["pear", "apple", "orange", "banana"]
# sort string array by the backward character
puts fruits.sort_by{|fruit| fruit.reverse}.inspect		# ["banana", "orange", "apple", "pear"]
puts fruits.inspect		# templately sort string array
fruits.sort!			# sort array in memory
puts fruits.inspect
# hash does not apply to sort methods, only way to may it apply is to convert it to array
hash1 = {'a' => 222, 'b' => 111, 'c' => 333, 'd' => 666}
hashArray = hash1.to_a
puts hashArray.inspect		# [["a", 222], ["b", 111], ["c", 333], ["d", 666]]
puts hashArray.sort {|k,v| k[0] <=> v[0]}.inspect		# [["a", 222], ["b", 111], ["c", 333], ["d", 666]]
puts hashArray.sort {|k,v| v[0] <=> k[0]}.inspect		# [["d", 666], ["c", 333], ["b", 111], ["a", 222]]