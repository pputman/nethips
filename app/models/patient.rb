class Patient < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
end
