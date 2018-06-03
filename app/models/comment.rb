class Comment < ApplicationRecord

	belongs_to :user ,required: false
	belongs_to :lecture ,required: false

end
