class AccountsController < ApplicationController

	before_action :set_member , only:[:show,:update,:destroy]
	rescue_from ActiveRecord::RecordNotFound , with: :invalid_member

	def show
		
	end

	private
		def set_member
			@member = Member.find(params[:id])
		end

		def invalid_member
			redirect_to root_path , alert: "Usuario inexistente"
			logger.error "Usuario inexistente: #{params[:id]}"
		end

end