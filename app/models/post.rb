class Post < ActiveRecord::Base

  belongs_to :user
  has_many :comment

  mount_uploader :image, PostUploader
end
