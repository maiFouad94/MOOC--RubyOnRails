class Course < ApplicationRecord

	has_many :lectures, dependent: :destroy
	belongs_to :user , required: false

end
