class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def update
  end

  def destroy
  end

  def show
    @group = Group.find(params[:id])
    @user_group = UserGroup.new
    @users = @group.users
    @markers = @users.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude
      }
  end
end
  def edit
  end

  def new
  @group = Group.new
  end
def add_user
group = Group.find(params[:id])
contact = User.find(params[:user_id])
UserGroups.create(user: contact, group: group)
end

def create
  @group = Group.new(group_params)
  @group.save!
  #  redirect_to group_path(@group)
  end

  private
  def group_params
    params.require(:group).permit(:name)
  end
end
