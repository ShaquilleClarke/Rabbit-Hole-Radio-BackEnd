class User < ApplicationRecord
    has_many :episodes
    has_secure_password
end
