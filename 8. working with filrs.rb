# Input/Output Basics
# I/O = Input/Output

# puts - print something with a line return\n
# print - print something with no line return
# gets - getting something back
# p - return the resurt as a string(with double qote)

a = "abc\tdef"
print a 	# abc	def
puts a 		# abc	def
p a 		# "abc\tdef"


# chomp - remove any line ending with ("\n", "\t", "\r\n")
puts "hello\n\t".chomp

# chop - always remove the last character (champ is usually better)
puts "hello".chop 		# hell


# ruby class IO
# file class
# Unix: shared/lib/myfile.rb
# windows: shared\lib\myfile.rb
# File.join('share', 'lib', 'myfile.rb')  will auto get it done no matter is unix or windows

# file permissions
# chmod: change permissions
# chown: change owner


# File Paths
# Absoulte Path: from the beginner of the computer, ex: c:/user/tim/download/fileName.txt
# Relative Path: from the current file get to another file, ex: ./../download/fileName.txt
# __FILE__: getting the current file name.
puts File.expand_path(__FILE__)		# return the full path of current file with file name
puts File.dirname(__FILE__)		# return the dir path of current file without file name


# # file mode
# r: read file start(must exist)
# w: write file from start, create it if not exist, and clean it if it exist
# a: append/ write from end
# r+: read and write but not clean the file
# w+: 
# a+: append to the end of the file and also read and write


# Accessing files
# file.new(fileName, mode)		# create a file
# file.open
# file.close

# # will open the exist file for doing a block of code then auto close it
# File.open('file.txt', 'r') do |file|
# 	# reading data from file
# end

# following code is opening the txtx file and write txt from the beginning
file = File.new('IO.txt', 'w')
file.puts "putting text"
file.puts "abcd"
file.puts "abcd"
file.puts "abcd"
file.puts "abcd"
file.close

# following code will rewrite the entire txt file
file = File.new('IO.txt', 'w')
file.puts "1 b c d e"
file.print "2  "
file.print "3  "
file.write "4  "
file << "5 "
file << "6 "
file.close



# reading file
# gets only reading one line of the file
file = File.new('IO.txt', 'r')
puts file.gets.chomp
puts file.gets.chomp
# puts file.gets.chomp  # getting no data back just nil, nil cannot handle chomp
puts file.gets			# not getting error because of it will get back nil
puts file.gets			# not getting error because of it will get back nil
file.close

file = File.new('IO.txt', 'r')
puts file.read(10)		# getting back 4 characters from the txt file
file.close

file = File.new('IO.txt', 'r')
puts file.read(10)		# getting back 4 characters from the txt file
file.close 


# looping text file line by line
File.open('IO.txt', 'r') do |file|
	while line = file.gets
		puts "** " + line.chomp + " **"
	end
end


# file pointer
puts "\n\nfile pointer"
file = File.open('IO.txt', 'r+')
puts file.pos
puts "read 3 character: " + (file.read(3))
puts "current file pointer: " + file.pos.to_s
puts file.gets.to_s		# gets the current line ending with whatever from the current pointer
# change file pointer and do more operation
file.pos = 1
puts file.gets 
puts file.gets 

# checking if the pointer reach the end of the file
puts file.eof?		# true/ false
puts file.pos
file.rewind		# take the file pointer back to the begin of the file
puts file.pos
# file.pos += 10  # pointer move backward 10 character

# file.lineno is not for the current txt file line number, it is for the internal gets used, like how many times of gets used
# it have nothing to do with the line number
puts file.lineno	# 0
puts file.gets	# returning the current file number
puts file.lineno	# 1
file.pos = 0
puts file.lineno	# 1, in the case i setting the pointer back to the beginning, but lineno still return 1
# following example might apply what is the point for this lineno
puts "\n\nlineno example:"
file.rewind
while line = file.gets 
	puts "line#{file.lineno}: #{line}"
end

# because for setting the position of the pointer
puts "\n\nsetting file pointer bad example, output by running the code"
file.rewind
file.pos += 100
file.write "position in 100"
file.rewind
while line = file.gets 
	puts "line#{file.lineno}: #{line}"
end
file.close




# Renameing and Deleting file
puts "\n\n\nrenaming and deleting file example"
file = File.new('rename_and_delete_file.txt', 'w')
file.puts "this file is for renaming and deleteing"	
file.close
# File.rename("oldName.txt", "newName.txt")
File.rename("rename_and_delete_file.txt", "newName.txt")




# copy file
puts "popying file example"
require 'fileutils'
FileUtils.copy('newName.txt', 'newName-copy.txt')
File.delete("newName.txt")

# file 
# 	- rename, delete/unlink

# FileUtils - ruby standard library: require 'firlutils'
# 	- cp/copy, mv/move, rm/remove
# 	- cd, chmod, chown, pwdm, In, touch, mkdir, rmdir


# puts " examining file details for basic information"
# checking the file status before doing anything
myFile = "IO.txt"
puts "File.exist?(myFile): " + File.exist?(myFile).to_s		# checking if the file exist before read or wirte
puts "File.file?(myFile): " + File.file?(myFile).to_s		# checking if is the file
puts "File.directory?(myFile): " + File.directory?(myFile).to_s		# telling it is a file or not
puts "File.readable?(myFile): " + File.readable?(myFile).to_s		# checking reading 
puts "File.writable?(myFile): " + File.writable?(myFile).to_s		# checking write 
puts "File.executable?(myFile): " + File.executable?(myFile).to_s 	# checking if the file is exe or script file 
puts "File.size(myFile): " + File.size(myFile).to_s	+ " bytes"		# return value in bytes
puts "File.dirname(myFile): " + File.dirname(myFile).to_s			# path from current dir
puts "File.expand_path(myFile): " + File.expand_path(myFile).to_s	# full path of the file
puts "File.basename(myFile): " + File.basename(myFile).to_s			# give back current file name
puts "File.extname(myFile): " + File.extname(myFile).to_s			# extantion of the file like .txt, .jpg, and etc
puts "File.atime(myFile): " + File.atime(myFile).to_s				# last time accessed time(read or write)
puts "File.mtime(myFile): " + File.mtime(myFile).to_s				# last modified time
puts "File.ctime(myFile): " + File.ctime(myFile).to_s				# laste status change time, 
								# NOT create time, read or write and change to owner, group, and permissions
								# try not to use

myFileCY = File.new(myFile, 'r')
puts myFileCY.stat
puts myFileCY.stat.size
puts myFileCY.stat.atime
# puts myFileCY.stat.property_name
myFileCY.close



# Working with Directories
puts "Working with Directories example"

# missing the last videos
