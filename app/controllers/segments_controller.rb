class SegmentsController < ApplicationController
    # before_action :authorized, only: [:create]
    
    def index
        segments = Segment.all
        render json: segments
    end

    def show
        segment = Segment.find_by(params[:id])
        render json: segment
    end

    
    def create
        video = Cloudinary::Uploader.upload(params[:video], :resource_type => :video)
        @segment = @episode.segments.create(video: video["url"])
        # byebug
        render json: @segment
    end

    def destroy
        video = Cloudinary::Uploader.destroy(id, :resource_type => :video)
        segment = Segment.destroy(video)
        render json: segment
    end

   

    # private

    # def segment_params
    #     video = Cloudinary::Uploader.upload(params[:video], :resource_type => :video)
    #     params.permit(:video, :episode_id)
    # end
end
