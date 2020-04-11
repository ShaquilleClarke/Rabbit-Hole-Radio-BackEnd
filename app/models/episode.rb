class Episode < ApplicationRecord
    belongs_to :user
    has_many :segments

    validates :title, presence: true
    validates :title, uniqueness: true
    validates :air_date, presence: true
    validates :air_date, uniqueness: true
end
