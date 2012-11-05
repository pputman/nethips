class CreatePatients < ActiveRecord::Migration
  def self.up
    create_table :patients do |t|
      t.string :name
      t.string :address
      t.integer :age
      t.string :sex
      t.string :treatment
      t.string :source

      t.timestamps
    end
  end

  def self.down
    drop_table :patients
  end
end
