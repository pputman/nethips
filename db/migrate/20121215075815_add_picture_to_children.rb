class AddPictureToChildren < ActiveRecord::Migration
  def self.up
    add_column :children, :picture, :string
  end

  def self.down
    remove_column :children, :picture
  end
end
