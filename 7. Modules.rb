# Modules are wrapper around Ruby code
# Module cannot instance
# Midules are used in conjunction with classes

# Namespacing allows for class names that dont conflict
# Namespacing can:
	# keep class names distinct from standard Ruby classes
	# Disambiguate your own class definitions
	# Ensure class used in open sourced code wont conflict

# module Romantic
# 	class Date 
# 		...
# 	end
# end

# dinner = Romantic::Date.new		# dateing with another person
# dinner.date = Date.new			# Ruby internal date class calender date



# Module need to come before the class
# 3 keyword will apply to modules: load, require, and include
# load - load a source file every time it is called
# require - loads a source file only once
# include - includes modules, NOTHING to do with files


class ToDoList
	include Enumerable

	attr_accessor :items

	def initialize
		@items = []
	end

	def each
		@items.each {|item| yield item}
	end
end

list = ToDoList.new
list.items = ['laundry', 'dishes', 'vacuum']
puts list.items.select {|i| i.length > 6}			# laundry

puts list.select {|i| i.length > 6}					# laundry, using Enumerable library