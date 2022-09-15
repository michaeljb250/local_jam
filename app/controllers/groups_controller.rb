class GroupsController < ApplicationController
  def index
    @groups = Group.all
    if params[:query]
      sql_query = "location ILIKE :query OR purpose ILIKE :query"
     @groups = @groups.where(sql_query, query: "%#{params[:query]}%")
    end
    @markers = @groups.geocoded.map do |group|
      rando = ["music-sheet-song.gif", "adancer.gif", "adanco.gif"]
      {

        lat: group.latitude,
        lng: group.longitude,
        info_window: render_to_string(partial: "info_window", locals: {group: group}),
        image_url: helpers.asset_url(rando.sample)
      }
    end
  end

  def update
  end

  def destroy
  end

  def show
    @group = Group.find(params[:id])
    @user_group = UserGroup.new
    @users = @group.users
    @message = Message.new
    @markers = @users.geocoded.map do |user|
      rando = ["music-sheet-song.gif", "adancer.gif", "adanco.gif"]
      {
        lat: user.latitude,
        lng: user.longitude,
        info_window: render_to_string(partial: "info_window", locals: {group: @group}),
        image_url: helpers.asset_url(rando.sample)
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
    params.require(:group).permit(:name, :purpose, :location)
  end
end
