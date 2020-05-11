class UsersController < ApplicationController
    
    def new
    end
    def create
    end
    def edit

    end
    def show
        @user = User.find_by(id: params[:id])
    end

    private
    def user_params
        params.require(:user).permit(:name, :city, :state, :bio, :username, :email, :title)
    end
end