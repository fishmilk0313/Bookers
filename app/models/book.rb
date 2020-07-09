class Book < ApplicationRecord
	validates :title, length: {minimum: 1}

	validates :body, length: {minimum: 1}
end
