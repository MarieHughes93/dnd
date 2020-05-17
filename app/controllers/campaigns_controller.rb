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
        @campaign = Campaign.new(campaign_params)
        @campaign.owner_id = current_user.id
        @campaign.users << current_user
        @campaign.save
        redirect_to campaign_path(current_user,@campaign)
      end
      def edit
        @campaign = Campaign.find_by(id: params[:id])
      end
      def update
        @campaign = Campaign.find_by(id: params[:id])
        @campaign.update(campaign_params)
        redirect_to campaign_path(current_user,@campaign)
      end

      def destroy
        @campaign = Campaign.find(params[:id])
      end

    private
    def campaign_params
        params.require(:campaign).permit(:name, :location, :story, :lvl, :owner_id)
    end
end