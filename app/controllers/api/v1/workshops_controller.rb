module Api
	module V1
		class WorkshopsController < ApplicationController
			include WorkshopsHelper
			skip_before_action :verify_authenticity_token
			before_action :set_user, only: [:register_workshop]
			before_action :set_workshop, only: [:payment_update]

			def register_workshop
				@workshop = Workshop.where(user: @user).sort_by(&:updated_at).last

				if @workshop != nil && @workshop.status == "Credit"
					render json: {status: true, is_paid: true, message: "Already Paid"}, status: :ok and return
				# elsif @workshop != nil && @workshop.status == "Failed"
				# 	render json: {status: true, is_paid: false, message: "Last Payment Failed"}, status: :ok and return
				else
					@workshop_resp = pay_for_workshop(@user)
					@workshop = Workshop.new(user: @user, payment_request_id: @workshop_resp["payment_request"]["id"], amount: @workshop_resp["payment_request"]["amount"].to_f, status: @workshop_resp["payment_request"]["status"], long_url: @workshop_resp["payment_request"]["longurl"])
					@workshop.save

					render json: {status: true, is_paid: false, message: "Need to pay", url: @workshop.long_url}, status: :ok and return
				end
			end

			def payment_update
				@workshop = @workshop.update(status: params[:status], order_id: params[:payment_id], mac: params[:mac])
			end

			def set_user
				@user = User.find_by(mathrix_id: params[:m_id])
				if @user == nil
					render json: {status: false, message: "User not registered"} and return
				end
			end

			def set_workshop
				@workshop = Workshop.find_by(payment_request_id: params[:payment_request_id])
			end
		end
	end
end