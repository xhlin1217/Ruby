# class
# class name first letter must be cap, otherwise will getting "class/module name must be CONSTANT" error
# class ClassName
# 	...
# end

# Attribute Methods
# attr_* methods (attr_reader, attr_writer, attr_accessor)
# attr_reader: name
# def name
# 	@name
# end

# attr_writer: name
# def name = (value)
# 	@name = value
# end

# attr_accessor: name
# def name
# 	@name
# end
# def name = (value)
# 	@name = value
# end

# initialize methods - method runs when define the object, only allow one initialize method each class

# class method - a methos that can be called on a class, even without an instance of the class
# def self.method_name
# 	...
# end


# class attributes - store values that apply to the class generally
# class variable - @@variable


# subclass overriding for some class inheritance, need to overright some method


# all of upper statement are common 
class Animal
	# Attributes
	# setter/getter = writter/reader
	attr_accessor :name 		# allow to read and write
	attr_writer :color			# allow to write only(setter)
	attr_reader :legs			# allow to read only(getter)


	def setWeight(newWeight)
		@weight = newWeight
	end
	def setAge(newAge)
		@age = newAge
	end

	def getWeight
		@weight
	end
	def getAge
		@age
	end
	
end

dog = Animal.new		# create an instance
dog.setAge(0)
puts dog.getAge		# 0

dog.name = "gaga"		# name allow both read and write
puts dog.name			# name allow both read and write
dog.color = "black"
# puts dog.color		# getting error because of color only allow to write but not read
# dog.legs = 4			# getting error because of color only allow to read but not write
puts dog.legs


class Animal2
	attr_accessor :color, :age, :weight

	# class method
	@@species = ['cat', 'cow', 'dog', 'duck', 'horse', 'pig']
	def self.all_species
		@@species
	end

	@@numberAnimal = 0
	def self.getNumberAnimal
		@@numberAnimal
	end

	# def initialize
	# 	@color = "black"
	# 	@age = 0
	# 	@weight = 10
	# end

	def initialize(color, age, weight)
		@color = color
		@age = age
		@weight = weight
		@@numberAnimal += 1
	end
end

# dog1 = Animal2.new
# puts dog1.color
# puts dog1.age
# puts dog1.weight

dog2 = Animal2.new("red", 100, 1000)
puts dog2.color			# red
puts dog2.age			# 100
puts dog2.weight		# 1000

puts Animal2.all_species.inspect		# ["cat", "cow", "dog", "duck", "horse", "pig"]
puts Animal2.getNumberAnimal



class Cow < Animal2
	attr_accessor :gender
	def initialize(color, age, weight, gender)
		@color = color
		@age = age
		@weight = weight
		@gender = gender
	end
end

cow1 = Cow.new("white", 1, 100, 'male')
puts cow1.color			# white
puts cow1.age			# 1
puts cow1.weight		# 100
puts cow1.gender		# male


class Pig < Animal2
	
end