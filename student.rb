require_relative'admin.rb'
require_relative'student_rights.rb'
require_relative 'book.rb'
require 'byebug'
# require 'irbtools'

class Student
	@@register    = {}
	@@information = {}
  

  def main_to_menu
    # puts " press 1 for Admin login \n press 2 for student login "
    # x = gets.chomp.to_i
    # case x
    # when 1
    #   puts " enter password for Admin_login "
    #   pwd = gets.chomp.to_i
    #   if ( pwd == 123 )
    #     puts " succesfully logged in "
    #     puts " press 1 for student register \n press 2 for delete the student \n press 3 for all students \n press 4 for admin_logout \n press 5 for back \n press 6 for book_operation"
    #     r = gets.chomp.to_i
    #     case r
    #     when 1
    #       return Student.new.register
    #     when 2
    #       return Student.new.delete 
    #     when 3
    #       return Student.new.list_of_student 
    #     when 4
    #       return Admin.new.logout_admin
    #     when 5
    #       return reway
    #     when 6
    #       return Admin_Login.new.book_operation_for_admin
    #     end 
    #   else
    #     puts " please retry "
    #     Admin_Login.new.admin_login
    #   end
    # when 2
    #   return Student.new.student_login
    # end
    return Admin.new.logout_admin
  end


  def register
		puts " please enter student_roll_no,name,password of student "
		r = gets.chomp.to_i
		n = gets.chomp.to_s
		pwd = gets.chomp.to_i
		@@register.store(r,n)
		@@information.store(r,pwd)
    puts "student is registered succesfully "
		return Admin.new.admin_rights
	end


 def reway
    puts " press 1 for Admin login \n press 2 for student login "
    x = gets.chomp.to_i
    case x
    when 1
      puts " enter password for Admin_login "
      pwd = gets.chomp.to_i
      if ( pwd == 123 )
        puts " succesfully logged in "
        puts " press 1 for student register \n press 2 for delete the student \n press 3 for all students \n press 4 for admin_logout \n press 5 for student login \n press 6 for book operation"
        r = gets.chomp.to_i
        case r
        when 1
          return Student.new.register , Admin.new.admin_rights
        when 2
          return Student.new.delete , Admin.new.admin_rights
        when 3
          return Student.new.list_of_student , Admin.new.admin_rights
        when 4
          return Admin.new.logout_admin
        when 5
          if (Student.new.student_login != 0)
            Student.new.student_login
                  elsif (Student.new.student_login == 0)
            puts " you need to login firstly "
            Student.new.student_login
          end 
        when 6
                     return Book.new.book_operation_admin
        end 
      else
        puts " please retry "
        Admin_Login.new.admin_login
      end
    when 2
      return Student.new.student_login
    end
  end

	def logout_student
      puts " successfully logged out! "
      return main_to_menu
    end

	def delete
        puts " enter the roll_no of that student you want delete "
        delete = gets.chomp.to_i
        @@register.delete(delete)
        puts " you have successfully deleted the student...................... "
        return Admin.new.admin_rights
    end

	def  list_of_student
      puts"---------------"
      @@register.each{|roll_no,naam| puts " #{roll_no}      #{naam} "}
      puts"---------------"
      return Admin.new.admin_rights
    end


  def student_login
    puts " enter student roll_no and password "
    student_roll     =  gets.chomp.to_i
    student_password =  gets.chomp.to_i 
    if( @@information[student_roll] == student_password ) 
      puts ( " welcome ! you have successfully login..... " )
      Book.new.book_operation_student
    else
      puts " please provide correct credentials...................... "
      return Library.new.main
      # puts " press 1 for student register \n press 2 for student login "
      # x = gets.chomp.to_i
      # case x
      # when 1
      #   return register
      # when 2
      #   return Student.new.student_login
      # end
    end
  end
end
 # Student.new.register
  # Student.new.student_login
