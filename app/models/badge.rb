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
	
end 
