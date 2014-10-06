# == Schema Information
#
# Table name: feats
#
#  id          :integer          not null, primary key
#  description :text
#  deadline    :date
#  completed   :boolean
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Feat < ActiveRecord::Base
	belongs_to :user 

	validates :description, presence: true, length: {maximum: 64}
	
end 
