class Members::OmniauthCallbacksController < ApplicationController

	def facebook
		session["devise.auth"] = request.env["omniauth.auth"]
		@member = Member.from_omniauth(session["devise.auth"])
		if @member.persisted?
			sign_in_and_redirect @member , event: :authentication
			return
		end
		render :edit
	end

	def failure
		redirect_to root_path , alert: "Funcion failure"
	end

	def complete_register
    @member = Member.from_omniauth(session["devise.auth"])
    if @member.update(member_params)
      sign_in_and_redirect @member, event: :authentication
    else
      render :edit
    end
	end

	private
		def member_params
			params.require(:member).permit(:name,:email,:username)
		end

end
