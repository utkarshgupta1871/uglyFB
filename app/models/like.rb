class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def self.already_liked(user_id,post_id)
  	@l=Like.find_by(user_id:user_id,post_id:post_id)
  	if @l==nil
  		return false
  	end
  	return true
  end
end
