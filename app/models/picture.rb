class Picture < ApplicationRecord
  mount_uploader :image, CreateImageUploader
  belongs_to :user
  has_many :favorites, dependent: :destroy
end
