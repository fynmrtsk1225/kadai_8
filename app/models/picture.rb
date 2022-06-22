class Picture < ApplicationRecord
  mount_uploader :image, CreateImageUploader

  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  
  validates :content, presence: true
  validates :image, presence: true
end
