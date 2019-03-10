module Api
	module V1
		class WorkshopsController < ApplicationController
			include WorkshopsHelper
			skip_before_action :verify_authenticity_token
			before_action :set_user, only: [:register_workshop, :check_status, :onspot_update]
			before_action :set_workshop, only: [:payment_update]

			def register_workshop
				if params[:online] == "no"
					@workshops = Workshop.where(user: @user, mode: "Onspot")
					render json: {status: true, online: false, is_paid: false, message: "Already registered for onspot payment"}, status: :ok and return if @workshops.count > 0
				end
				@workshop = Workshop.where(user: @user).sort_by(&:updated_at).last

				if @workshop != nil && @workshop.status == "Credit"
					render json: {status: true, online: true, is_paid: true, message: "Already Paid"}, status: :ok and return
				# elsif @workshop != nil && @workshop.status == "Failed"
				# 	render json: {status: true, is_paid: false, message: "Last Payment Failed"}, status: :ok and return
				else
					if params[:online] == "no"
						@workshop = Workshop.new(user: @user, amount: 450.00, status: "Pending", mode: "Onspot")
						@workshop.save
						render json: {status: true, online: false, is_paid: false, message: "Need to pay"}, status: :ok and return

					else
						@workshop_resp = pay_for_workshop(@user)
						@workshop = Workshop.new(user: @user, payment_request_id: @workshop_resp["payment_request"]["id"], amount: @workshop_resp["payment_request"]["amount"].to_f, status: @workshop_resp["payment_request"]["status"], long_url: @workshop_resp["payment_request"]["longurl"], mode: "Online")
						@workshop.save

						render json: {status: true, online: true, is_paid: false, message: "Need to online", long_url: @workshop.long_url}, status: :ok and return
					end
				end
			end

			def payment_update
				@workshop = @workshop.update(status: params[:status], order_id: params[:payment_id], mac: params[:mac])
			end

			def check_status
				@workshop = Workshop.where(user: @user).sort_by(&:updated_at).last
				if @workshop.status == "Credit"
					@is_paid = true
				else
					@is_paid = false
				end
			end

			def onspot_update
				@workshop = Workshop.where(user: @user).sort_by(&:updated_at).last
				@workshop = @workshop.update(status: "Paid")
				render json: {status: true, message: "Paid successfully!", mode: "onspot"}
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