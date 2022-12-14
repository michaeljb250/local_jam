class UsersController < ApplicationController
  before_action :set_user, only: [:follow, :unfollow]

  def index
    @users = User.where.not(id: current_user.id)
    if params[:txt]
       sql_query = "instrument ILIKE :txt OR first_name ILIKE :txt"
      @users = @users.where(sql_query, txt: "%#{params[:txt]}%")
    end
  # The `geocoded` scope filters only flats with coordinates
  @markers = @users.geocoded.map do |user|
    rando = ["music-sheet-song.gif", "adancer.gif", "adanco.gif"]
    {
      lat: user.latitude,
      lng: user.longitude,
      info_window: render_to_string(partial: "info_window2", locals: {user: user}),
        image_url: helpers.asset_url(rando.sample)
    }
  end
  end

  def show
    @user = User.find(params[:id])
    @reviews = @user.reviewees
  end

  def follow
    if current_user.follow(@user.id)
      respond_to do |format|
        format.html { redirect_to user_path(@user) }
        format.js
      end
    else
      redirect_to root_path
    end
  end

  def unfollow
    if current_user.unfollow(@user.id)
      respond_to do |format|
        format.html { redirect_to user_path(@user) }
        format.js { render action: :follow }
      end
    end
  end
end
  private

  def set_user
    @user = User.find(params[:id])
  end
def profile
   @user = current_user
end

def user_params
  params.require(:user).permit(:email,:photo, :video)
end
