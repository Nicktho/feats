# == Schema Information
#
# Table name: badges
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  image       :text
#

class Badge < ActiveRecord::Base
	has_and_belongs_to_many :users
	
end 
