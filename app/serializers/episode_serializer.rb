class EpisodeSerializer < ActiveModel::Serializer
  attributes :id, :title, :air_date
  has_many :segments
  belongs_to :user
end
