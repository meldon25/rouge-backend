class WelcomeController < ApplicationController
def index
    render json: { status: 200, message: "Rouge API" }
end
end
