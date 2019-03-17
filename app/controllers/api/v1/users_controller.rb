module Api
	module V1
		class UsersController < ApplicationController
			skip_before_action :verify_authenticity_token
			before_action :set_user, only: [:onspot]

			def index

			end

			def create
				@user = User.where(email: user_params[:email])
				if @user.count == 0 
					@user = User.new(user_params)
					unless @user.save
						render json: {status: false, is_reg: false, message: @user.errors.full_messages.to_sentence}, status: :unprocessable_entity and return 
					end
				else
					render json: {status: true, is_already_reg: true, message: "Already Registered.", email: @user.first.email}
					@user.resend_mail
				end
			end

			def onspot
				@present = Userevent.find_by(user: @user)
				render json: {status: true, message: "Already Registered"}, status: :ok and return if @present != nil
				@userevnts = Userevent.create(user: @user, event_id: params[:event1])
				@userevnts = Userevent.create(user: @user, event_id: params[:event2])
				@userevnts = Userevent.create(user: @user, event_id: params[:event3])
				render json: {status: true, message: "Registration Success"}, status: :ok and return
			end

			def set_user
				@user = User.find_by(mathrix_id: params[:m_id])
				if @user == nil
					render json: {status: true, is_user: false, message: "User not registered"}, status: :ok and return
				end
			end

			private
			def user_params
				params.permit(:college_name, :name, :roll_no, :email, :mobile, :course, :year, :gender)
			end
		end
	end
end
  