class Segment < ApplicationRecord
    belongs_to :episode
    has_one_attached :song_file
end
