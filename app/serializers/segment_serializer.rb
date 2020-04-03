class SegmentSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :title, :song_file
  belongs_to :episode

  def song_file
    return unless object.song_file.attached?

    object.song_file.blob.attributes
      .slice('filename', 'byte_size')
      .merge(url: song_file_url)
      .tap { |attrs| attrs['name'] = attrs.delete('filename') }      
    end
    
  end

  def song_file_url
    url_for(object.song_file)
  end
    
end


