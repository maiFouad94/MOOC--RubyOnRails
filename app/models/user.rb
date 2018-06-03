class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :image, ImageUploader 
  validates :name, :image, presence: true
      
  enum gender: {male: 0,female: 1,any: 2}
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :courses, dependent: :destroy
  has_and_belongs_to_many :lectures, dependent: :destroy
  has_many :comments, dependent: :destroy

end
