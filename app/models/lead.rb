class Lead < ActiveRecord::Base
  enum status: [:inactive, :active]
  validates_uniqueness_of  :email
  validates_presence_of  :email
end
