class SegmentsController < ApplicationController
    before_action :authorized, only: [:persist]
    
    def index
        segments = Segment.all.with_attached_song_file
        render json: segments
    end

    def show
        segment = Segment.find_by(params[:id])
        render json: segment
    end

    
    def create
        @segment = Segment.create(segment_params)
        if @segment.valid?
            wristband = encode_token({segment_id: @segment.id})
            render json: { segment: SegmentSerializer.new(@segment), token: wristband }, status: 201
        else
            render json: {error: "Access Denied"}
        end
    end

    def perist
        wristband = encode_token({segment_id: @segment.id})
        render json: { segment: SegmentSerializer.new(@segment), token: wristband }
    end

    private

    def segment_params
        params.permit(:title, :episode_id, :song_file)
    end
end
