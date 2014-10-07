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
		case self.condition_operator
		when '='
			user_value.to_i == self.condition_value.to_i
		when '>'
			user_value.to_i > self.condition_value.to_i
		when '<'
			user_value.to_i < self.condition_value.to_i
		end 
	end 
	
end 
