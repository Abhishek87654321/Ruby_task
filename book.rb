require_relative 'admin.rb'
require_relative 'admin_login.rb'
require_relative 'student.rb'
require_relative 'student_rights.rb'
# require_relative 'library.rb'
# require 'byebug'

class Book
    @@book = {}
    @@book_issue = []
    @@book_issue_request = {}
	  @@book_return_request = {}
  def book_operation_admin
		puts " press 1 for add_book \n press 2 for delete_book \n press 3 list_of_books_in_library \n press 4 to know_all_book_issue_request \n press 5 for issue_book \n press 6 for back \n press 7 for book_return_request "
    input_for_book_operation = gets.chomp.to_i
    case input_for_book_operation
    when 1
      return book_add 
    when 2
      return book_delete
    when 3
      return list_of_books_in_library
    when 4
      return issue_request_list
    when 5
      return issue_book
    when 6
      return Admin.new.admin_rights
    when 7
      return all_return_request_list, Admin.new.admin_rights
    end
	end
    

    def book_operation_student
    	puts " press 1 for issue_request \n press 2 for my issue_book_list \n press 3 for list_of_books_in_library \n press 4 for student logout \n press 5 for back"
      i = gets.chomp.to_i
      case i
      when 1
        return issue_request, book_operation_student
      when 2
        return books_for_specified_student,book_operation_student
      when 3
        return list_of_books_in_library,book_operation_student
      when 4
        return Student.new.logout_student
      when 5
        return Sright.new.student_rights
      end
    end


	def book_add
      puts "enter book_name and quantity "
      book_name = gets.chomp.to_s
      quantity  = gets.chomp.to_i
      @@book.store(book_name,quantity) 
      return Admin_Login.new.book_operation_for_admin
    end

    def book_delete
      puts " enter that book name thatone you want delete it "
      bn = gets.chomp.to_s
      @@book.delete(bn)
      return Admin_Login.new.book_operation_for_admin
    end
 

    def book_return
       puts " enter book_name you want to return "
       br = gets.chomp.to_s
       if(!@@book["#{br}"])
         @@book["#{br}"] += 1
       else
         @@book["#{br}"] = 1
        end
       return Admin_Login.new.book_operation_for_admin
    end

def list_of_books_in_library
  puts"---------------"
  if (@@book.empty?)
     puts "there are no books in library"
  else
    @@book.each { |naam,quantity| puts " #{naam}      #{quantity} " }
  end
  puts "---------------"
  return Admin_Login.new.book_operation_for_admin
end


def issue_book
   puts " enter book_name and student_roll_no "
   book_name = gets.chomp.to_s
   student_roll = gets.chomp.to_i
   # byebug
   if(@@book["#{book_name}"] != nil)
      @@book["#{book_name}"] =@@book["#{book_name}"] - 1
     h = {}
     h.store(student_roll,book_name)
     @@book_issue.push(h)
     puts "press 1 for all_book in library \n press 2 for all_student \n press 3 for logout admin \n press 4 back to menu \n press 5 for student login"
      i = gets.chomp.to_i
      case i
      when 1
        return list_of_books_in_library
      when 2
        return Student.new.list_of_student
      when 3 
        return Admin.new.logout_admin
      when 4
        return Student.new.main_to_menu
      when 5
       return Student.new.student_login 
      end                
   else 
     puts " not available "
     return issue_book
   end
end



def issue_request
 puts " enter the book name and student_roll_no to requesting for book issue "
 book_name = gets.chomp.to_s
 roll_no   = gets.chomp.to_i
 # byebug
 if(@@book[book_name] != 0)
   puts " you have successfully requested the book "
   @@book_issue_request.store(roll_no , book_name)
  end
end
 
 def issue_request_list
  @@book_issue_request.each { |roll_no , book_name| puts " #{roll_no}      #{book_name} " }
  return book_operation_admin
 end
 

 def create_return_request
   puts "enter book_name and student roll_no by book return"
   n = gets.chomp.to_s
   r = gets.chomp.to_i
   @@book_return_request.store(r,i)
 end


def all_return_request_list
     @@book_return_request.each { |roll_no , book_name| puts " #{roll_no}      #{book_name} " }
end
 # def return_book
 #   puts "enter the book name and student_roll_no for you want to return"
 #   n = gets.chomp.to_s
 #   r =gets.chomp.to_i
 #   @@book[#{}]
 # end

 def books_for_specified_student
 	puts " enter the student_roll_no for that you want all books "
 	roll_no = gets.chomp.to_i
 	b = @@book_issue.clone
 	values = b.map{|h| h[roll_no]}.compact
  if (values !=0)
 	    puts values
    else
      puts "issued books are: 0"
    end
 end

end