require_relative 'student.rb'
require_relative 'book.rb'
# require_relative 'library.rb'
class Sright
	def student_rights
		puts " press 1 for student register /n press 2 for student login /n press 3 for list_of_student "
		i = gets.chomp.to_i
		case i
		when 1
			return Student.new.register
		when 2
			if(Student.new.student_login != 0)
				puts " press 1 for issue_book_request \n press 2 for my_issue_book_list \n press 3 for student_logout \n press 4 for back \n press 5 for back_to_menu \n press 6 for book_return_request"
				b = gets.chomp.to_i
				 case b
				 when 1
				 	return Book.new.issue_request, student_rights
				 when 2
				 	return my_issue_book_list,student_rights
				 when 3
				 	return Student.new.logout_student
				 when 4
				 	return student_rights
				 when 5
				 	return Student.new.main_to_menu
				 when 6
				 	return Book.new.create_return_request , student_rights
				 end
			else
				puts " you have to need logout firstly "
				Student.new.logout_student
			end
		when 3
			return Student.new.list_of_student
		end
	end
end