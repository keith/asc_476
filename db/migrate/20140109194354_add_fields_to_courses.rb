class AddFieldsToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :hidden, :boolean
    add_column :courses, :disabled, :boolean
  end
end
