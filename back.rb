require_relative  'admin_login.rb'
require_relative  'student.rb'
require_relative 'admin.rb'
class Back
	def backward
		# puts " press 1 for admin login \n press 2 for student login"
		#  input = gets.chomp.to_i
		#  case input
		#  when 1
		#  	return Admin_Login.new.admin_login 
		#  when 2
		#  	return  Student.new.student_login
		#  end
		return Admin.new.logout_admin
	end

end