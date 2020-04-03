class EpisodesController < ApplicationController
    before_action :authorized, only: [:persist]


    def index
        episodes = Episode.all 
        render json: episodes
    end

    def show
        episode = Episode.find_by(params[:id])
        render json: episode
    end
    
    def create
        @episode = Episode.create(episode_params)
        if @episode.valid?
            wristband = encode_token({episode_id: @episode.id})
            render json: { episode: EpisodeSerializer.new(@episode), token: wristband }, status: 201
        else
            render json: {error: "Access Denied"}
        end
    end

    def perist
        wristband = encode_token({episode_id: @episode.id})
        render json: { episode: EpisodeSerializer.new(@episode), token: wristband }
    end


    private

    def episode_params
        params.permit(:title, :user_id, :air_date)
    end


end
