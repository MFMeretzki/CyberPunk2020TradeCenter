class User < ApplicationRecord
	has_many :articles, dependent: :destroy

	validates :nick, :presence => true, :uniqueness => true
	
	validates :password, :confirmation => true
	attr_accessor :password_confirmation
	attr_reader :password
	validate :password_must_be_present	
	
	def User.authenticate(nick, password)
		if user = find_by_nick(nick)
			if user.hashed_pass == encrypt_password(password, user.salt)
				user
			end
		end
	end
	
	def User.encrypt_password(password, salt)
		Digest::SHA2.hexdigest(password + "wiblleW" + salt)
	end
	
	def password=(password)
		@password = password
		if password.present?
			check_type
			generate_salt
			self.hashed_pass = self.class.encrypt_password(password, self.salt)
		end
	end
	
	private
	
		def password_must_be_present
			errors.add(:password, "Missing password") unless hashed_pass.present?
		end
		
		def check_type		
			if self.user_type == nil
				self.user_type = 3
			end
		end
		
		def generate_salt
			self.salt = self.salt.object_id.to_s + rand.to_s
		end
	
end