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

convert to array
to_ary, to_a

Negative indices start counting from the end, with -1 being the last element
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
arr.fetch(100) #=> IndexError: index 100 outside of array bounds: -6...6
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
arr.each { |a| print a -= 10, " " }
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
# select! and reject! are the corresponding destructive methods to select and reject
# Similar to select vs. reject, delete_if and keep_if have the exact opposite result when supplied with the same block:
arr.delete_if { |a| a < 4 } #=> [4, 5, 6]
arr                         #=> [4, 5, 6]

arr = [1, 2, 3, 4, 5, 6]
arr.keep_if { |a| a < 4 } #=> [1, 2, 3]
arr                       #=> [1, 2, 3]


# Public Class Methods