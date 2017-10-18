class Category < ApplicationRecord
  has_many :listing , dependent: :destroy
end
