require_relative 'student.rb'
require_relative 'admin.rb'
require_relative 'student_rights.rb'
require_relative 'admin_login.rb'
require_relative 'book.rb'
require 'byebug'

class Library
	def main
		puts " press 1 for Admin login \n press 2 for student login "
		x = gets.chomp.to_i
		case x
		when 1
			puts " enter password for Admin_login "
			pwd = gets.chomp.to_i
			if ( pwd == 123 )
				puts " succesfully logged in "
				puts " press 1 for student register \n press 2 for delete the student \n press 3 for all students \n press 4 for admin_logout \n press 5 for back \n press 6 for book_operation"
				r = gets.chomp.to_i
				case r
				when 1
					return Student.new.register, Admin.new.admin_rights
				when 2
					return Student.new.delete , Admin.new.admin_rights
				when 3
					return Student.new.list_of_student , Admin.new.admin_rights
				when 4
					return Admin.new.logout_admin
				when 5
					return Student.new.reway
				when 6
					return Admin_Login.new.book_operation_for_admin
				end	
			else
				puts " please retry "
				Admin_Login.new.admin_login
			end
		when 2
			return Student.new.student_login
		end
	end
end
Library.new.main