class LendedBook < ApplicationRecord
	belongs_to :user
	has_one :return_request, dependent: :destroy
end
