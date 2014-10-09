# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  theme_option    :string(255)
#  image           :text
#  xp              :integer
#  level           :integer
#  created_at      :datetime
#  updated_at      :datetime
#  admin           :boolean
#

class User < ActiveRecord::Base
	has_secure_password

	has_many :feats
	has_and_belongs_to_many :badges

	has_attached_file :avatar, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }
  
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

	validates :username, presence: true, uniqueness: true, length: {minimum: 3}
	validates :email, presence:true

	def xp_to_percent 
		xp_until_next_level = (self.level + 1) * 100 # Each level costs 100xp
  	xp_as_percent = (100 - (xp_until_next_level - self.xp)).to_s + "%" # get the percent
	end 

	def update_level 
		self.level = self.xp / 100
	end 
end 
