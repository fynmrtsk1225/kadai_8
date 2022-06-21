class Picture < ApplicationRecord
  mount_uploader :image, CreateImageUploader
  belongs_to :user
end
