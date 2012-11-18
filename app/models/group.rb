class Group < ActiveRecord::Base
  attr_accessible :name, :friend

  has_many :group_users
end
