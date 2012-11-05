class AddPictureToPatient < ActiveRecord::Migration
  def self.up
    add_column :patients, :picture, :string
  end

  def self.down
    remove_column :patients, :picture
  end
end
