class Episode < ApplicationRecord
    belongs_to :user
    has_many :segments
end
