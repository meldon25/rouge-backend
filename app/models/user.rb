class User < ApplicationRecord
    has_secure_password
    has_many :wishlists 
    has_many :products, through: :wishlists

end
