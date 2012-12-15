class AddClassToChild < ActiveRecord::Migration
  def self.up
    add_column :children, :class_form, :string
    add_column :children, :support_received, :string
  end

  def self.down
    remove_column :children, :support_received
    remove_column :children, :class_form
  end
end
