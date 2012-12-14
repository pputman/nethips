class AddArchiveToChildren < ActiveRecord::Migration
  def self.up
    add_column :children, :archive, :boolean
  end

  def self.down
    remove_column :children, :archive
  end
end
