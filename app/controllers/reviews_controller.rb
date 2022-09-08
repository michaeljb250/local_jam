class ReviewsController < ApplicationController
#   def create
#     @user = User.find(params[:user_id])
#   end

#   def index
#   end

#   def destroy
#   end

#   def show
#   end

#   def new
#   end
# end
def new
  @review = Review.new
  @user = User.find(params[:user_id])
end

def create
  @review = Review.new(review_params)
  @user = User.find(params[:user_id])
  @review.reviewee_id = @user.id
  @review.reviewer_id = current_user.id
  if @review.save!
      redirect_to user_path(@user)
  else
      render 'new'
  end
end

private

  def review_params
      params.require(:review).permit(:content)
  end
end
