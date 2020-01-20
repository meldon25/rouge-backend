class Product < ApplicationRecord
    has_many :wishlists
    has_many :users, through: :wishlists, dependent: :destroy
end
