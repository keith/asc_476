class CreateApplicants < ActiveRecord::Migration
  def change
    create_table :applicants do |t|
      t.string :name
      t.string :email
      t.string :wuid
      t.string :phone_number
      t.string :class_standing
      t.float :gpa
      t.datetime :gpa_timestamp
      t.text :comment
      t.string :major
      t.string :minor
      t.boolean :work_study

      t.timestamps
    end
  end
end
