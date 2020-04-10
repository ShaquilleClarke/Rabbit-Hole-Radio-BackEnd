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
        # @episode = Episode.find_by(params[:id])
        video = Cloudinary::Uploader.upload(params[:video], :resource_type => :video)
        segment = Segment.create(video: video["url"], episode_id: params[:episode_id], title: params[:title])
        render json: segment
    end

    def destroy
        
        video = Cloudinary::Uploader.destroy(:public_id, :resource_type => "video")
        segment = Segment.destroy(params[:id])
        render json: segment
    end

   

    # private

    # def segment_params
    #     video = Cloudinary::Uploader.upload(params[:video], :resource_type => :video)
    #     params.permit(:episode_id, video: video["url"])
    # end
end
