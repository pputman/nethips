class ChangePatientsToStrings < ActiveRecord::Migration
  def self.up
    change_column :patients, :date_registered, :string
    change_column :patients, :deceased, :string
    change_column :patients, :children, :string
  end

  def self.down
    change_column :patients, :date_registered, :date
    change_column :patients, :deceased, :boolean
    change_column :patients, :children, :integer
  end
end
