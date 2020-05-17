class CampaignMemberships < ApplicationController
    def create
        @memberships = CampaignMemberships.all
        @memberships = @Campaign.memberships.all
    end
    
    def index  
     end

    def delete
       end

    private

    def membership_params
        params.require(:ride).permit(:user_id, :campaign_id, campaign_attributes:[:campaign_id])
    end
end