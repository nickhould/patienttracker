class Group < ActiveRecord::Base
  attr_accessible :name

  has_many :group_users
end
