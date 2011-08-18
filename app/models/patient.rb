class Patient < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
  attr_accessor :upload
  
  jtable :basic, :name, :address, :age, :sex, :treatment, :source, :picture
  
  def jtable_basic_attribute_picture
    if self.picture.blank?
      false
    else
      true
    end
  end
  
  def jtable_basic_attribute_sex
    if self.sex.downcase == "m"
      "Male"
    elsif self.sex.downcase == "f"
      "Female"
    else
      ""
    end
  end
end
