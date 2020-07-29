class Request < ApplicationRecord
	#validates :book_id, :uniqueness => {:scope => [:status, :user_id, :request_type]}
	belongs_to :user
	belongs_to :book
	belongs_to :lended_book, required: false
	validates_presence_of :request_type
	validate do 
		if !['Pending','Rejected','Approved'].include? self.status
			self.errors.add(:status, "Status should be either 'Pending','Rejected' or 'Approved'")
		end
	end
	validate do 
		if !['lend','return'].include? self.request_type
			self.errors.add(:status, "request type should be either 'lend' or 'return'")
		end
	end

	validate do
		if self.request_type=="return" 
			validates_presence_of :lended_book_id
		end	
	end
	
end
