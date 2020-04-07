class SegmentsController < ApplicationController
    before_action :authorized, only: [:create]
    
    def index
        segments = Segment.all.with_attached_song_file
        render json: segments
    end

    def show
        segment = Segment.find_by(params[:id])
        render json: segment
    end

    
    def create
        @segment = @episode.segments.create(segment_params)
        render json: @segment.episode
    end

   

    private

    def segment_params
        params.permit(:title, :song_file)
    end
end
