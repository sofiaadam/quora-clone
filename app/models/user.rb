class User < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	validates :fullname, presence: true
	validates :password, presence: true
	validates :email, presence: true, uniqueness: true
	validate :validating_password, :validating_email
	before_create :validating_password, :validating_email
	has_secure_password

	has_many :questions
	has_many :answers

	def validating_password
		unless self.password.length >= 6
			errors.add(:password, "length is too short.")
		end
	end
	
	def validating_email
		unless self.email =~ /\w+@\w+\.\w{2,}/
			errors.add(:email, "is not valid.")
		end
	end
end
