class EpisodesController < ApplicationController
    before_action :authorized, only: [:create]


    def index
        episodes = Episode.all
        render json: episodes
    end

    def show
        episode = Episode.find_by(params[:id])
        render json: episode
    end
    
    def create
        @episode = @user.episodes.create(episode_params)
        render json: @episode
    end

    # def persist
    #     infoToSaveInBox = {episode_id: @episode.id}
    #     wristband = encode_token(infoToSaveInBox)
    #     render json: { episode: EpiosdeSerializer.new(@episode), token: wristband }
    # end 

    def destroy
        episode = Episode.destroy(params[:id])
        render json: episode
    end


    private

    def episode_params
        params.permit(:title, :air_date)
    end


end
