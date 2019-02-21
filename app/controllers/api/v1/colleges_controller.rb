module Api
  module V1
    class CollegesController < ApplicationController
      def index
        @colleges = College.all.sort_by{|i| i.name} 
        render json: {status: false, message: "No colleges found"}, status: :not_found and return if @colleges.count == 0
      end
    end
  end
end