class MembershipsController < ApplicationController
  before_action :get_campaign
  def index
    @memberships = @campaign.memberships
    @campaign = Campaign.find_by(id: params[:campaign_id])
  end

  def new
    @membership = @campaign.memberships.build
  end
  
  def create
    @membership = @campaign.memberships.build(membership_params)
    @membership.user_id = current_user.id
    @membership.character_attributes=(params[:character])
    @membership.save
    redirect_to campaign_path(@membership.campaign_id)
  end

  def destroy
    @membership = Membership.find_by(campaign_id: params[:campaign_id])
    @membership.destroy
    redirect_to campaigns_path
  end

  private

  def membership_params
    params.require(:membership).permit(:user_id, :campaign_id, character_attributes: [:name])
  end

  

  def get_campaign
    @campaign = Campaign.find(params[:campaign_id])
  end

end
