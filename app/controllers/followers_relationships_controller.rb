class FollowersRelationshipsController < ApplicationController
  def create
    followed = User.find(params[:user_id])
    @relation = FollowersRelationship.new(follower_id: current_user.id,
                                          followed_id: followed.id)

    @relation.save
    redirect_to user_path(followed)
  end

  def destroy
    @relation = FollowersRelationship.find(params[:id])

    @relation.destroy
    redirect_to user_path(@relation.followed_id)
  end
end
