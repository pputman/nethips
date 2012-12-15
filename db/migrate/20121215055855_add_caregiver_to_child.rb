class AddCaregiverToChild < ActiveRecord::Migration
  def self.up
    add_column :children, :caregiver_name, :string
    add_column :children, :plcode, :string
    add_column :children, :caregiver_relationship, :string
    add_column :children, :caregiver_contact_no, :string
    add_column :children, :caregiver_address, :string
    add_column :children, :caregiver_age, :string
    add_column :children, :caregiver_occupation, :string
  end

  def self.down
    remove_column :children, :caregiver_occupation
    remove_column :children, :caregiver_age
    remove_column :children, :caregiver_address
    remove_column :children, :caregiver_contact_no
    remove_column :children, :caregiver_relationship
    remove_column :children, :plcode
    remove_column :children, :caregiver_name
  end
end
