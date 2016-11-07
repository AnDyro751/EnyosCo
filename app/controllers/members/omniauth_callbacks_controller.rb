class Members::OmniauthCallbacksController < ApplicationController

	def facebook
		@member = Member.from_omniauth(request.env["omniauth.auth"])
		if @member.persisted?
			sign_in_and_redirect @member , event: :authentication
			return
		end
		session["devise.auth"] = request.env["omniauth.auth"]
		redirect_to root_path , notice: "#{@member.errors.full_messages}"
	end

	def failure
		redirect_to root_path , alert: "Funcion failure"
	end

end
