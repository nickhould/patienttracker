class GroupUser < ActiveRecord::Base
  attr_accessible :admin, :group_id, :user_id

  belongs_to :group
  belongs_to :user
end
