class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable , :omniauth_providers => [:facebook]

   def self.from_omniauth(auth)
		where(provider: auth.provider , uid: auth.uid).first_or_create do |member|
			
			if auth.info
				member.email = auth.info.email
				member.name = auth.info.name
				member.image = auth.info.image
			end
			member.password = Devise.friendly_token[0,20]
		
		end
   end
end