class LendedBook < ApplicationRecord
	belongs_to :user
	belongs_to :book
	has_one :request, dependent: :destroy
	validates_presence_of :name, :username, :status
	validate do 
		if !['Returned','Holding'].include? self.status
			self.errors.add(:status, "Status should be either 'Returned' or 'Holding'")
		end
	end
end
