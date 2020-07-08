class LendedBook < ApplicationRecord
	belongs_to :user
	belongs_to :book
	has_one :request, dependent: :destroy
end
