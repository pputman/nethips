class AddArchiveToPatient < ActiveRecord::Migration
  def self.up
    add_column :patients, :archive, :boolean, :default => false
  end

  def self.down
    remove_column :patients, :archive
  end
end
