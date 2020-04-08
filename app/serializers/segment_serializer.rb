class SegmentSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :song_file
  belongs_to :episode
  
  
  def song_file
    rails_blob_path(object.song_file, only_path: true) if object.song_file.attached? 
  end

  
    
 

  
end


