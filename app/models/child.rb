class Child < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
  attr_accessor :upload

  jtable :basic, :ovc_id, :name, :address, :contact_no, :age, :sex, :hiv_status, :weight, :treatment_code_of_parent, :treatment_type, :support_group, :location, :school

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
