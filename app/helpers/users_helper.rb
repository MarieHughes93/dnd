module UsersHelper

    def owned_campaigns
        @owned_campaign = Campaign.where(owner_id: params[:id])
    end
end