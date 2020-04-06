class UsersController < ApplicationController
  before_action :authorized, only: [:persist]

  def index
    user = User.all 
    render json: user
  end

  def show
    user = User.find_by(params[:id])
    render json: user
  end

  def create
    @user = User.create(user_params)
    if @user.valid? 
      infoToSaveInBox = {user_id: @user.id}
      wristband = encode_token(infoToSaveInBox)
      render json: { user: UserSerializer.new(@user), token: wristband }, status: 201
    else
      render json: {error: "Oh no you diiiddn't"}  
    end
    
  end

  def login
    @user = User.find_by(username: params[:username])
        
    if @user && @user.authenticate(params[:password])
      infoToSaveInBox = {user_id: @user.id}
      wristband = encode_token(infoToSaveInBox)
      render json: {user: UserSerializer.new(@user), token: wristband}
    else 
      render json: {error: "Thats not you!"} 
    end
    
  end

  def persist
    infoToSaveInBox = {user_id: @user.id}
    wristband = encode_token(infoToSaveInBox)
    render json: { user: UserSerializer.new(@user), token: wristband }
  end 

  private

  def user_params
    params.permit(:username, :password)
  end
  
  
end
