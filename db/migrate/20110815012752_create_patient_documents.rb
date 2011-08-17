class CreatePatientDocuments < ActiveRecord::Migration
  def self.up
    create_table :patient_documents do |t|
      t.string :document

      t.timestamps
    end
  end

  def self.down
    drop_table :patient_documents
  end
end
