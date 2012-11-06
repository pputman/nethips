class AddFieldsToPatients < ActiveRecord::Migration
  def self.up
    add_column :patients, :number, :string
    add_column :patients, :plhiv_code, :string
    add_column :patients, :plhiv_name, :string
    add_column :patients, :support_group, :string
    add_column :patients, :weight, :string
    add_column :patients, :treatment_code, :string
    add_column :patients, :telephone, :string
    add_column :patients, :date_registered, :date
    add_column :patients, :occupation, :string
    add_column :patients, :marital_status, :char
    add_column :patients, :children, :integer
    add_column :patients, :line_of_treatment, :string
    add_column :patients, :next_of_kin_contact, :string
    add_column :patients, :disclosed_status, :string
    add_column :patients, :transfer_in, :string
    add_column :patients, :transfer_out, :string
    add_column :patients, :co_infected, :string
    add_column :patients, :treatment_default, :string
    add_column :patients, :type_of_service_received, :string
    add_column :patients, :deceased, :boolean
  end

  def self.down
    remove_column :patients, :deceased
    remove_column :patients, :type_of_service_received
    remove_column :patients, :treatment_default
    remove_column :patients, :co_infected
    remove_column :patients, :transfer_out
    remove_column :patients, :transfer_in
    remove_column :patients, :disclosed_status
    remove_column :patients, :next_of_kin_contact
    remove_column :patients, :line_of_treatment
    remove_column :patients, :children
    remove_column :patients, :marital_status
    remove_column :patients, :occupation
    remove_column :patients, :date_registered
    remove_column :patients, :telephone
    remove_column :patients, :treatment_code
    remove_column :patients, :weight
    remove_column :patients, :support_group
    remove_column :patients, :plhiv_name
    remove_column :patients, :plhiv_code
    remove_column :patients, :number
  end
end
