class CreateChildren < ActiveRecord::Migration
  def self.up
    create_table :children do |t|
      t.integer :ovc_id
      t.string :name
      t.string :address
      t.string :contact_no
      t.string :age
      t.string :sex
      t.string :hiv_status
      t.string :weight
      t.string :treatment_code_of_parent
      t.string :treatment_type
      t.string :support_group
      t.string :location
      t.string :school

      t.timestamps
    end
  end

  def self.down
    drop_table :children
  end
end
