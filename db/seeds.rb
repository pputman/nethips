# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
require 'open-uri'

Patient.delete_all
open("../output.csv") do |patients|
  patients.read.each_line do |patient|
    name, address, telephone, age, sex, treatment, source, plhiv_code, plhiv_name, support_group, weight, treatment_code, date_registered, occupation, marital_status, children, line_of_treatment, next_of_kin_contact, disclosed_status, transfer_in, transfer_out, co_infected, treatment, type_of_service_received, deceased = patient.chomp.split(",")
    Patient.create!(:name => name, :address => address, :telephone => telephone, :age => age, :sex => sex, :treatment => treatment, :source => source, :plhiv_code => plhiv_code, :plhiv_name => plhiv_name, :support_group => support_group, :weight => weight, :treatment_code => treatment_code, :date_registered => date_registered, :occupation => occupation, :marital_status => marital_status, :children => children, :line_of_treatment => line_of_treatment, :next_of_kin_contact => next_of_kin_contact, :disclosed_status => disclosed_status, :transfer_in => transfer_in, :transfer_out => transfer_out, :co_infected => co_infected, :treatment => treatment, :type_of_service_received => type_of_service_received, :deceased => deceased)
  end
end

Children.delete_all
open("../output.csv") do |children|
  children.read.each_line do |child|
    ovc_id, name, address, contact_no, age, sex = child.chomp.split(",")
    Child.create!(:ovc_id => ovc_id :address => address, :contact_no => contact_no, :age => age, :sex => sex, :hiv_staus => hiv_status, :weight => weight, :treatment_code_of_parent => treatment_code_of_parent, :treatment_type => treatment_type, :support_group => support_group, :location => location, :school => school, :class => class, :support_received => support_received, :caregiver_name => caregiver_name, :plcode => plcode, :caregiver_relationship, caregiver_relationship, :caregiver_contact_no => caregiver_contact_no, :caregiver_address => caregiver_address, :caregiver_age => caregiver_age, :caregiver_occupation => caregiver_occupation)
  end
end
