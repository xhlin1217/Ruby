# Mix-Ins
module ContactInfo
	attr_accessor :firstName, :lastName, :City, :state, :zipCode

	def initialize(first, last, city, state, zipcode)
		@firstName = first
		@lastName = last
		@city = city
		@state = state
		@zipCode = zipcode
	end

	def fullName
		return @firstName + " " + @lastName
	end

	def cityStateZip
		csz = @City
		csz += ", #{@state}" if @state
		csz += ", #{@zipCode}" if @zipCode
	end
end