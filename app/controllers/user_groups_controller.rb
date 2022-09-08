class UserGroupsController < ApplicationController
  def create
   @group = Group.find(params [:group_id])
   @user = User.find(params[:user_group][:user_id])
   @user_group = UserGroup.new
   @user_group.group = @group
   @user_group.user = @user
   if @user_group.save
    redirect_to group_path(@group)
   else
    render "groups/show", status: :unprocessable_entity
  end
end
