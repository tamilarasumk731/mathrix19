class Event < ApplicationRecord
	has_many :userevents, dependent: :destroy
	has_many :users, through: :userevents
end
