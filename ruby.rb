# p vs puts:
# p: puts array.inspect, puts array in one line
# puts: display information WITH a end-line
# print: display information WITHOUT a end-line
# a = [1, 2, 3]
# p a.inspect		# "[1, 2, 3]"
# puts a.inspect	# [1, 2, 3]

# create array
array = [1, 'two', 3.0]		#=> [1, "two", 3.0]
ary = Array.new    #=> []
Array.new(3)       #=> [nil, nil, nil]
Array.new(3, true) #=> [true, true, true]

Array.new(4) { Hash.new }  #=> [{}, {}, {}, {}]
Array.new(4) {|i| i.to_s } #=> ["0", "1", "2", "3"]
Array({:a => "a", :b => "b"}) #=> [[:a, "a"], [:b, "b"]]

# build up multi-dimensional arrays
empty_table = Array.new(3) { Array.new(3) }
#=> [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]

# convert to array
# to_ary, to_a

# Negative indices start counting from the end, with -1 being the last element
arr = [1, 2, 3, 4, 5, 6]
arr.at(0) #=> 1
arr[2]    #=> 3
arr[100]  #=> nil
arr[-3]   #=> 4
arr[2, 3] #=> [3, 4, 5]
arr[1..4] #=> [2, 3, 4, 5]
arr[1..-3] #=> [2, 3, 4]
arr.first #=> 1
arr.last  #=> 6
arr.take(3) #=> [1, 2, 3], to return the firt n elements of the array use take
arr.drop(3) #=> [4, 5, 6], return the elements after n elements have been dropped



# To raise an error for indices outside of the array bounds or else to provide a default value when that happens, you can use fetch.
arr = ['a', 'b', 'c', 'd', 'e', 'f']
# arr.fetch(100) #=> IndexError: index 100 outside of array bounds: -6...6
arr.fetch(100, "oops") #=> "oops"


# checking array size by using length, count, size
browsers = ['Chrome', 'Firefox', 'Safari', 'Opera', 'IE']
browsers.length #=> 5
browsers.count #=> 5
browsers.size #=> 5
browsers.empty? #=> false, # checking array is empty or not 
browsers.include?('Konqueror') #=> false, checking if array includeing particular item


# adding item to array, push and <<
# unshift add new item to the beginning of an array
# insert add new item to any position of array
arr = [1, 2, 3, 4]
arr.push(5) #=> [1, 2, 3, 4, 5]
arr << 6    #=> [1, 2, 3, 4, 5, 6]
arr.unshift(0) #=> [0, 1, 2, 3, 4, 5, 6]
arr.insert(3, 'apple')  #=> [0, 1, 2, 'apple', 3, 4, 5, 6]
arr.insert(3, 'orange', 'pear', 'grapefruit')
#=> [0, 1, 2, "orange", "pear", "grapefruit", "apple", 3, 4, 5, 6]



# remove item from array
# pop: pop out the last element form the array and return it
# shift: remove the first element form the array
# delete_at: remove an element at a particulat index
# delete: remove particular element anywhere in an array
# compact(!): remove the nil elements form the array
# uniq(!): remove duplicate elements from array
arr = [1, 2, 3, 4, 5, 6]
arr =  [1, 2, 3, 4, 5, 6]
arr.pop #=> 6
arr #=> [1, 2, 3, 4, 5]
arr.shift #=> 1
arr #=> [2, 3, 4, 5]
arr.delete_at(2) #=> 4
arr #=> [2, 3, 5]
arr = [1, 2, 2, 3]
arr.delete(2) #=> 2
arr #=> [1,3]
arr = ['foo', 0, nil, 'bar', 7, 'baz', nil]
arr.compact  #=> ['foo', 0, 'bar', 7, 'baz']
arr          #=> ['foo', 0, nil, 'bar', 7, 'baz', nil]
arr.compact! #=> ['foo', 0, 'bar', 7, 'baz']
arr          #=> ['foo', 0, 'bar', 7, 'baz']
arr = [2, 5, 6, 556, 6, 6, 8, 9, 0, 123, 556]
arr.uniq #=> [2, 5, 6, 556, 8, 9, 0, 123]



# Iterating over Arrays
arr = [1, 2, 3, 4, 5]
# arr.each { |a| print a -= 10, " " }
puts
# prints: -9 -8 -7 -6 -5 #=> [1, 2, 3, 4, 5]
# reverse_each which will iterate over the elements in the array in reverse order.
words = %w[first second third fourth fifth sixth]
str = ""
words.reverse_each { |word| str += "#{word} " }
str #=> "sixth fifth fourth third second first "

# The map method can be used to create a new array based on the original array, but with the values modified by the supplied block:
arr.map { |a| 2*a }   #=> [2, 4, 6, 8, 10]
arr                   #=> [1, 2, 3, 4, 5]
arr.map! { |a| a**2 } #=> [1, 4, 9, 16, 25]
arr                   #=> [1, 4, 9, 16, 25]



# Selecting Items from an Array
arr = [1, 2, 3, 4, 5, 6]
arr.select { |a| a > 3 }     #=> [4, 5, 6]
arr.reject { |a| a < 3 }     #=> [3, 4, 5, 6]
arr.drop_while { |a| a < 4 } #=> [4, 5, 6]
arr                          #=> [1, 2, 3, 4, 5, 6]
[1,2,3,4,5].select { |num|  num.even?  }   #=> [2, 4]

a = %w{ a b c d e f }
a.select { |v| v =~ /[aeiou]/ }  #=> ["a", "e"]


# select! and reject! are the corresponding destructive methods to select and reject
# Similar to select vs. reject, delete_if and keep_if have the exact opposite result when supplied with the same block:
arr.delete_if { |a| a < 4 } #=> [4, 5, 6]
arr                         #=> [4, 5, 6]

arr = [1, 2, 3, 4, 5, 6]
arr.keep_if { |a| a < 4 } #=> [1, 2, 3]
arr                       #=> [1, 2, 3]


# Public Class Methods
Array.[]( 1, 'a', /^A/ ) # => [1, "a", /^A/]
Array[ 1, 'a', /^A/ ]    # => [1, "a", /^A/]
[ 1, 'a', /^A/ ]         # => [1, "a", /^A/]

array1 = ['tim', 'lin']
array2 = Array.new(array1)
array1.inspect		# ["tim", "lin"]
array2.inspect		# ["tim", "lin"]
array1 == array2		# true
array1.equal? array2	# false


Array.new(3){ |index| index ** 2 }		# => [0, 1, 4], 0^2=0, 1^2=1, 2^2=4

# checking the following 2, this is importment
# Since all the Array elements store the same hash, changes to one of them will affect them all.
a = Array.new(2, Hash.new)	# => [{}, {}]
a[0]['cat'] = '1'
a # => [{"cat"=>"1"}, {"cat"=>"1"}]
a[1]['cat'] = '2'
a # => [{"cat"=>"2"}, {"cat"=>"2"}]

a = Array.new(2) { Hash.new }	# [{}, {}]
a[0]['cat'] = 'feline'
a # => [{"cat"=>"feline"}, {}]


# datatypeClass + try_convert: will get back either the datatype or nil
array = [1,2,3]
if Array.try_convert(array)
	# will fill with this condition, array is arrayType
elsif String.try_convert(array)
			# do something 
end

string = 'not array'
if Array.try_convert(string)
			#do something 
elsif String.try_convert(string)
	#will fill with this condition, string is stringType
end


# Public Instance Methods
# & => uniq, | =>union
a = [1,2,3]
b = [1,2,4]
(a&b).inspect	# [1, 2]
(a|b).inspect	# [1, 2, 3, 4]
(a*3).inspect	# [1, 2, 3, 1, 2, 3, 1, 2, 3]
(a*',').inspect	# "1,2,3"
(a+b).inspect	# [1, 2, 3, 1, 2, 4], not only limit on number array, will work on all the datatype
([ 1, 1, 2, 2, 3, 3, 4, 5 ] - [ 1, 2, 4 ]).inspect  #=>  [ 3, 3, 5 ], will remove all the item form first array which from second array.


# append: <<, push
a # [1, 2, 3]
a << 4
a << [5,6]
a.push(7)
a 	# [1, 2, 3, 4, [5, 6], 7]

# ary <=> other_ary → -1, 0, +1 or nil
# a <=> b
#   if a < b then return -1
#   if a = b then return  0
#   if a > b then return  1
#   if a and b are not comparable then return nil
[ "a", "a", "c" ]    <=> [ "a", "b", "c" ]   #=> -1
[ 1, 2, 3, 4, 5, 6 ] <=> [ 1, 2 ]            #=> +1
[ 1, 2 ]             <=> [ 1, :two ]         #=> nil
[1,2,3]				 <=> [1,2,3]			 #=> 0


a = [ "a", "b", "c", "d", "e" ]
a[2] +  a[0] + a[1]    #=> "cab"
a[6]                   #=> nil
a[1, 2]                #=> [ "b", "c" ]
a[1..3]                #=> [ "b", "c", "d" ]
a[4..7]                #=> [ "e" ]
a[6..10]               #=> nil
a[-3, 3]               #=> [ "c", "d", "e" ]
# special cases
a[5]                   #=> nil
a[6, 1]                #=> nil
a[5, 1]                #=> []
a[5..10]               #=> []


a = Array.new
a[4] = "4";                 #=> [nil, nil, nil, nil, "4"]
a[0, 3] = [ 'a', 'b', 'c' ] #=> ["a", "b", "c", nil, "4"]
a[1..2] = [ 1, 2 ]          #=> ["a", 1, 2, nil, "4"]
a[0, 2] = "?"               #=> ["?", 2, nil, "4"]
a[0..2] = "A"               #=> ["A", "4"]
a[-1]   = "Z"               #=> ["A", "Z"]
a[1..-1] = nil              #=> ["A", nil]
a[1..-1] = []               #=> ["A"]
a[0, 0] = [ 1, 2 ]          #=> [1, 2, "A"]
a[3, 0] = "B"               #=> [1, 2, "A", "B"]


a = [1,2,3,4,5]
# any? [{ |obj| block }] → true or false 
a.any? { |num| num < 3 }	# true

# assoc(obj) → element_ary or nil 
# Returns the first contained array that matches (that is, the first associated ARRAY), or nil if no match is found.
s1 = [ "colors", "red", "blue", "green" ]
s2 = [ "letters", "a", "b", "c" ]
s3 = "foo"
a  = [ s1, s2, s3 ] 	# [["colors", "red", "blue", "green"], ["letters", "a", "b", "c"], "foo"]
a.assoc("red")  #=> [ "letters", "a", "b", "c" ]
a.assoc("foo")      #=> nil

a = [[1,2,3],[2,3,4],[3,4,5]]
a.assoc(1)	# [1, 2, 3]

# at(index) → obj or nil 
a = [ "a", "b", "c", "d", "e" ]
a.at(0)     #=> "a"
a.at(-1)    #=> "e"
a.at(10)	#=> nil


# binary search(O(log n)): bsearch {|x| block } → elem
ary = [0, 4, 7, 10, 12]
ary.bsearch {|x| x >=   4 } #=> 4
ary.bsearch {|x| x >=   6 } #=> 7
ary.bsearch {|x| x >=  -1 } #=> 0
ary.bsearch {|x| x >= 100 } #=> nil


a = [1,2,3,4,5,6,7,8]
# collect { |item| block } → new_ary 
a.collect{ |item| item > 4 }		# [false, false, false, false, true, true, true, true]


# combination(n) → Enumerator 
a = [1, 2, 3, 4]
a.combination(1).to_a  #=> [[1],[2],[3],[4]]
a.combination(2).to_a  #=> [[1,2],[1,3],[1,4],[2,3],[2,4],[3,4]]
a.combination(3).to_a  #=> [[1,2,3],[1,2,4],[1,3,4],[2,3,4]]
a.combination(4).to_a  #=> [[1,2,3,4]]
a.combination(0).to_a  #=> [[]] # one combination of length 0
a.combination(5).to_a  #=> []   # no combinations of length 5

# array.clear	 # remover all elements from array
a.clear    #=> [ ]


# compact → new_ary, Returns a copy of self with all nil elements removed.
a = [ "a", nil, "b", nil, "c", nil ]
a.compact	#=> [ "a", "b", "c" ]


# compact! → ary or nil
# Removes nil elements from the array.
# Returns nil if no changes were made, otherwise returns the array.
a.compact! 	#=> [ "a", "b", "c" ]
a 		# ["a", "b", "c"]
a.compact!  # nil


# concat(other_ary) → ary  => >>
[ "a", "b" ].concat( ["c", "d"] ) #=> [ "a", "b", "c", "d" ]
a = [ 1, 2, 3 ]
a.concat( [ 4, 5 ] )
a                                 #=> [ 1, 2, 3, 4, 5 ]
# array size
a.count
a.length
a.size

a = ["a", "b", "c"]
# a.cycle { |x| puts x }     # print, a, b, c, a, b, c,.. forever.
# a.cycle(2) { |x| puts x }  # print, a, b, c, a, b, c.


# delete(obj) → item or nil 
# delete(obj) { block } → item or result of block
a = [ "a", "b", "b", "b", "c" ]
a.delete("b")                   #=> "b"
a                               #=> ["a", "c"]
a.delete("z")                   #=> nil
a.delete("z") { "not found" }   #=> "not found"


# delete_at(index) → obj or nil
# delete and return the index element, or nil if the index is out of range
a = ["ant", "bat", "cat", "dog"]
a.delete_at(2)    #=> "cat"
a                 #=> ["ant", "bat", "dog"]
a.delete_at(99)   #=> nil


# delete_if { |item| block } → ary 
scores = [ 97, 42, 75 ]
scores.delete_if {|score| score < 80 }   #=> [97]


# drop(n) → new_ary : drop the first n item and return the rest of the elements in an array
a = [1, 2, 3, 4, 5, 0]
a.drop(3)             #=> [4, 5, 0]


# drop_while { |obj| block } → new_ary 
a = [1, 2, 3, 4, 5, 0]
a.drop_while {|i| i < 3 }   #=> [3, 4, 5, 0]


a = [ "a", "b", "c" ]
# a.each {|x| print x, " -- " }	#=> a -- b -- c -- 
puts 

# array.empty? => return true or false, if the array is empty or not
[].empty?   #=> true


# eql?(other) → true or false => return true if both object are same object, otherwise return false
arr1 = [1,2,3]
arr2 = [1,2,3]
arr1.eql?(arr1)		#=> true
arr1.eql?(arr2)		#=> true
arr1.eql?([4,5,6])	#=> false


# featch: Tries to return the element at position index, but throws an IndexError exception if the referenced index lies outside of the array bounds.
a = [ 11, 22, 33, 44 ]
a.fetch(1)               #=> 22
a.fetch(-1)              #=> 44
a.fetch(4, 'cat')        #=> "cat"
# a.fetch(100) { |i| puts "#{i} is out of bounds" }	#=> "100 is out of bounds"


a = [ "a", "b", "c", "d" ]
a.fill("x")              #=> ["x", "x", "x", "x"]
a.fill("z", 2, 2)        #=> ["x", "x", "z", "z"]
a.fill("y", 0..1)        #=> ["y", "y", "z", "z"]
a.fill { |i| i*i }       #=> [0, 1, 4, 9]
a.fill(-2) { |i| i*i*i } #=> [0, 1, 8, 27]


# index: return the index value of the item in array
a = [ "a", "b", "c" ]
a.index("b")              #=> 1
a.index("z")              #=> nil
a.index { |x| x == "b" }  #=> 1


# first(n)-> newArray: return first n item form array
a = [ "q", "r", "s", "t" ]
a.first     #=> "q"
a.first(2)  #=> ["q", "r"]


# flatten: combine multi-dimensional array into one
s = [ 1, 2, 3 ]           #=> [1, 2, 3]
t = [ 4, 5, 6, [7, 8] ]   #=> [4, 5, 6, [7, 8]]
a = [ s, t, 9, 10 ]       #=> [[1, 2, 3], [4, 5, 6, [7, 8]], 9, 10]
a.flatten                 #=> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
a = [ 1, 2, [3, [4, 5] ] ]
a.flatten(1)              #=> [1, 2, 3, [4, 5]]
a.flatten	              #=> [1, 2, 3, [4, 5]]


# array.include?(object) -> true/false : true if array contained object
a = [ "a", "b", "c" ]
a.include?("b")   #=> true
a.include?("z")   #=> false


# replace: replace array with another value
a = [ "a", "b", "c", "d", "e" ]
a.replace([ "x", "y", "z" ])   #=> ["x", "y", "z"]
a                              #=> ["x", "y", "z"]


a = %w{ a b c d }
a.insert(2, 99)         #=> ["a", "b", 99, "c", "d"]
a.insert(-2, 1, 2, 3)   #=> ["a", "b", 99, "c", 1, 2, 3, "d"]


# array.join: combines the elements together
[ "a", "b", "c" ].join        #=> "abc"
[ "a", "b", "c" ].join("-")   #=> "a-b-c"


# keep_if { |item| block } → ary 
a = %w{ a b c d e f }
a.keep_if { |v| v =~ /[aeiou]/ }  #=> ["a", "e"]


# array.last: return the last item
# array.last(n): return the last n item form the array
a = [ "w", "x", "y", "z" ]
a.last     #=> "z"
a.last(2)  #=> ["y", "z"]


# map { |item| block } → new_ary : get every item in array and apply the operation block one by one
a = [1,2,3]
a.map{|x| x**2}		#=> [1,4,9]


# permutation 
a = [1, 2, 3]
a.permutation.to_a    #=> [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
a.permutation(1).to_a #=> [[1],[2],[3]]
a.permutation(2).to_a #=> [[1,2],[1,3],[2,1],[2,3],[3,1],[3,2]]
a.permutation(3).to_a #=> [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
a.permutation(0).to_a #=> [[]] # one permutation of length 0
a.permutation(4).to_a #=> []   # no permutations of length 4



# pop: pop off the last item and return it form the array, nil for empty array
# pop(n): pop off the last n item and return it as array form the array
a = [ "a", "b", "c", "d" ]
a.pop     #=> "d"
a.pop(2)  #=> ["b", "c"]
a         #=> ["a"]


# product(other_ary, ...) → new_ary 
# product(other_ary, ...) { |p| block } → ary 
# return an array of all combinations of elements from all arrays
[1,2,3].product([4,5])     #=> [[1,4],[1,5],[2,4],[2,5],[3,4],[3,5]]
[1,2].product([1,2])       #=> [[1,1],[1,2],[2,1],[2,2]]
[1,2].product([3,4],[5,6]) #=> [[1,3,5],[1,3,6],[1,4,5],[1,4,6],
                           #     [2,3,5],[2,3,6],[2,4,5],[2,4,6]]
[1,2].product()            #=> [[1],[2]]
[1,2].product([])          #=> []


# rassoc(obj) → element_ary or nil : searches through the arrat whose elements are also arrays
a = [ [ 1, "one"], [2, "two"], [3, "three"], ["ii", "two"] ]
a.rassoc("two")    #=> [2, "two"]
a.rassoc("four")   #=> nil



# reverse: return a new array containing it self ekements in reverse order:
[ "a", "b", "c" ].reverse   #=> ["c", "b", "a"]
[ 1 ].reverse               #=> [1]



# rotate!(count=1) → ary : rotate self in place so that the element ar count comes first, ad return self
a = [ "a", "b", "c", "d" ]
a.rotate        #=> ["a", "b", "c", "d"]
a.rotate!        #=> ["b", "c", "d", "a"]
a                #=> ["b", "c", "d", "a"]
a.rotate!(2)     #=> ["d", "a", "b", "c"]
a.rotate!(-3)    #=> ["a", "b", "c", "d"]



# sample: returning a random element from array or n elements form array
a = [1,2,3,4,5,6,7]
a.sample			#=> 4
a.sample(4)       #=> [6, 4, 2, 5]


# shift → obj or nil 
# shift(n) → new_ary 
# remove the first element or first n elements of self and return it, return nil if array is empty
args = [ "-m", "-q", "filename" ]
args.shift     #=> "-m"
args           #=> ["-q", "filename"]

args = [ "-m", "-q", "filename" ]
args.shift(2)  #=> ["-m", "-q"]
args           #=> ["filename"]




# shuffled: return a new array with elements of self shuffled
a = [1,2,3,4,5,6,7,8,9,10]
a.shuffle 	# [5,2,3,9,6,1,8,7,4,10]
a 			# [1,2,3,4,5,6,7,8,9,10]


# slice: return subarray of array
# slice(index) → obj or nil 
# slice(start, length) → new_ary or nil 
# slice(range) → new_ary or nil 
a = [ "a", "b", "c" ]
a.slice!(1)     #=> "b"
a               #=> ["a", "c"]
a.slice!(-1)    #=> "c"
a               #=> ["a"]
a.slice!(100)   #=> nil
a               #=> ["a"]


# array.sort -> return a new array
a = [1,5,3,6,7,4,2]
a 			# [1, 5, 3, 6, 7, 4, 2]
a.sort		# [1, 2, 3, 4, 5, 6, 7]
a 			# [1, 5, 3, 6, 7, 4, 2]


# take_while { |obj| block } → new_ary 
# take the item as long as it item meets the condition
a = [1, 2, 3, 4, 5, 0]
a.take_while { |i| i < 3 }  #=> [1, 2]


# to_a → ary : convert the current object to array
# to_ary → ary : convert the current object to array
# to_h → hash : convert the current object to hash


# transpose → new_ary matirx transpose
a = [[1,2], [3,4], [5,6]]
p a.transpose   #=> [[1, 3, 5], [2, 4, 6]]
# [1,2]			[1,3,5]
# [3,4]	==>		[2,4,6]
# [5,6]


# uniq → new_ary : remove all the duplicate item
a = [ "a", "a", "b", "b", "c" ]
a.uniq   # => ["a", "b", "c"]

b = [["student","sam"], ["student","george"], ["teacher","matz"]]
b.uniq { |s| s.first } # => [["student", "sam"], ["teacher", "matz"]]
# Returns nil if no changes are made (that is, no duplicates are found).
a = [ "a", "a", "b", "b", "c" ]
a.uniq!   # => ["a", "b", "c"]

b = [ "a", "b", "c" ]
b.uniq!   # => nil

c = [["student","sam"], ["student","george"], ["teacher","matz"]]
c.uniq! { |s| s.first } # => [["student", "sam"], ["teacher", "matz"]]



# values_at(selector, ...) → new_ary : return an array containing the elements in self corresponding to the given selector

a = %w{ a b c d e f }
a.values_at(1, 3, 5)          # => ["b", "d", "f"]
a.values_at(1, 3, 5, 7)       # => ["b", "d", "f", nil]
a.values_at(-1, -2, -2, -7)   # => ["f", "e", "e", nil]
a.values_at(4..6, 3...6)      # => ["e", "f", nil, "d", "e", "f"]
