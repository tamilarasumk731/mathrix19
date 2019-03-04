module Api
	module V1
		class UsersController < ApplicationController
			skip_before_action :verify_authenticity_token

			def index

			end

			def create
				@user = User.where(email: user_params[:email])
				if @user.count == 0 
					@user = User.new(user_params)
					unless @user.save
					render json: {status: false, messages: @user.errors.full_messages.to_sentence}, status: :unprocessable_entity and return 
					end
				else
					render json: {status: true, message: "Already Registered.", email: @user.first.email}
					@user.resend_mail
				end
			end

			private
			def user_params
				params.permit(:college_id, :name, :roll_no, :email, :mobile, :course, :mathrix_id, :year, :gender)
			end
		end
	end
end
  