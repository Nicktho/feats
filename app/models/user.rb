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
#

class User < ActiveRecord::Base
	has_secure_password

	has_many :feats
	has_and_belongs_to_many :badges

	validates :username, presence: true, uniqueness: true, length: {minimum: 3}
	validates :email, presence:true
end 
