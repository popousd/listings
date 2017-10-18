class Listing < ApplicationRecord
  mount_uploader :picture, PictureUploader

  belongs_to :user
  belongs_to :category 

  #validate :is_price_number?
  #validates_presence_of :title, :description, :picture, :price
end
