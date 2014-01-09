class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.text :professor_comments
      t.boolean :professor_verdict
      t.boolean :professor_taught
      t.integer :application_status
      t.text :asc_comments
      t.belongs_to :applicant
      t.belongs_to :professor
      t.belongs_to :course

      t.timestamps
    end
  end
end
