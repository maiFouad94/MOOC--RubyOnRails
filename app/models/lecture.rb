class Lecture < ApplicationRecord
	
	mount_uploader :attachment, AttachmentUploader
	belongs_to :course ,required: false
	has_and_belongs_to_many :users ,required: false
	has_many :comments, dependent: :destroy
	acts_as_votable

end
