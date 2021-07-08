require_relative 'student.rb'
require_relative 'book.rb'
require_relative 'admin_login.rb'
require_relative 'back.rb'

class Admin

	def logout_admin
		# puts " you have successfully logout "
		puts " press 1 for all_student \n press 2 for all_book \n press 3 for Admin_login \n press 4 to know the books_for_specified_student "
		i = gets.chomp.to_i
		case i
		when 1
			return Student.new.list_of_student,Student.new.reway
		when 2
			return Book.new.list_of_books_in_library,Student.new.reway
		when 3
			return Admin_Login.new.admin_login
		when 4
			return Book.new.books_for_specified_student,Student.new.reway
		end
	end


	def admin_rights
		puts " press 1 for student_register \n press 2 for student_delete \n press 3 for all students \n press 4 for admin logout \n press 5 for back to menu \n press 6 for book operation \n press 7 for all_book_return_request \n press 8 for book return"
		a = gets.chomp.to_i
		case a
		when 1
			return Student.new.register
		when 2
			return Student.new.delete
		when 3
			return Student.new.list_of_student
		when 4
			return logout_admin
		when 5
			return Back.new.backward
		when 6
			return Book.new.book_operation_admin 
		when 7
			return Book.new.all_return_request_list
		when 8
			return Book.new.book_return
		end
	end
end