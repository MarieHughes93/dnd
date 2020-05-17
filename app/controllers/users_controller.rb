class UsersController < ApplicationController
    def show
        @user = User.find_by(id: params[:id])
    end
    def index
        @users = User.all
    end

    private
    def user_params
        params.require(:user).permit(:name, :city, :state, :bio, :username, :email, :title)
    end
end