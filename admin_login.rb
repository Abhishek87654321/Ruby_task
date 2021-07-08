require_relative 'admin.rb'
require_relative 'book.rb'
require_relative 'back.rb'

class Admin_Login
	def admin_login
      puts " please enter  admin password "
      pwd = gets.chomp.to_i
      if( pwd == 123 )
         puts " succesfully logged in "
         Admin.new.admin_rights
      else
      	puts " please try again "
      	admin_login
      end
   end


   def book_operation_for_admin
      puts " press 1 for add_book \n press 2 for delete book \n press 3 for list of books in library \n press 4 to know all book issue request \n press 5 for books_for_specified_student \n press 6 for back to menu"
      x = gets.chomp.to_i
      case x
      when 1
         return Book.new.book_add
      when 2
         return Book.new.book_delete
      when 3
        return Book.new.list_of_books_in_library
     when 4
      return Book.new.issue_request_list
   when 5
      return Book.new.books_for_specified_student
   when 6
      return Back.new.backward
   end
end
end
 # Admin_Login.new.admin_login