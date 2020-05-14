class CampaignsController < ApplicationController
    def index
        @campaigns = Campaign.all 
      end
      def show
        @campaign = Campaign.find_by(id: params[:id])
      end
      def new
        @user = User.find_by(id: params[:id])
        @campaign = Campaign.new
      end
      def create
        @campaign = Campaign.create(campaign_params)
        redirect_to user_campaign_path(@campaign)
      end
      def edit
        @campaign = Campaign.find_by(id: params[:id])
      end
      def update
        @campaign = Campaign.find_by(id: params[:id])
        @campaign.update(campaign_params)
        redirect_to user_campaign_path(@campaign)
      end

    private
    def campaign_params
        params.require(:user).permit(:name, :location, :story, :lvl, :owner_id)
    end
end