class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  before_action :authenticate_token, except: [:login, :create]
  before_action :authorize_user, except: [:login, :create, :index]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: get_current_user
  end

  # # POST /users
  # def create
  #   @user = User.new(user_params)

  #   if @user.save
  #     render json: @user, status: :created, location: @user
  #   else
  #     render json: @user.errors, status: :unprocessable_entity
  #   end
  # end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  # REGISTER /register
  def register 
    @user = User.new(user_params)
    if @user.save 
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  #LOGIN /login
  def login
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      token = create_token(@user.id, @user.username)
      render status: 200, json: {token: token, user: @user}
    else 
      render status: 401,  json: {message: "Unauthorized"}
    end
  end

  def authorize_user
    p "AUTHORIZE USER"
    p "user id: #{get_current_user.id}"
    p "params: #{params[:id]}"
    render json: {status: 401, message: 'Unauthorized'} unless get_current_user.id == params[:id].to_i
  end

def get_current_user 
    return if !bearer_token
    decoded_jwt = decode_token(bearer_token)
    User.find(decoded_jwt[0]["user"]["id"])
end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.permit(:username, :password)
    end

     #TOKEN auth
     def create_token(id, username)
      JWT.encode(payload(id, username), ENV['JWT_SECRET'], 'HS256')
    end

    #PAYLOAD auth
    def payload(id, username)
      {
        exp: (Time.now + 30.minutes).to_i,
        iat: Time.now.to_i,
        iss: ENV['JWT_ISSUER'],
        user: {
          id: id,
          username: username
        }
      }
    end

    # Only allow a trusted parameter "white list" through.
end
