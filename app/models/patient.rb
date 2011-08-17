class Patient < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
  attr_accessor :upload
end
