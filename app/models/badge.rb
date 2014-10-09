# == Schema Information
#
# Table name: badges
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  description        :text
#  image              :text
#  condition_variable :string(255)
#  condition_operator :string(255)
#  condition_value    :string(255)
#

class Badge < ActiveRecord::Base
	has_and_belongs_to_many :users

	def conditions_met?(user)
		user_value = user.send(self.condition_variable)
		con_val = self.condition_value
		if user_value.is_a? Integer 
			test_user = user_value
			test_con = con_val.to_i
		elsif user_value.is_a? String 
			test_user = user_value.upcase
			test_con = con_val.upcase
		end
		case self.condition_operator
		when '='
			test_user == test_con
		when '>'
			test_user > test_con
		when '<'
			test_user < test_con	
		when "contains" 
			test_user.include? test_con
		end 
	end 
	
end 
