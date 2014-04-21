class RemoveDisabledFromCourses < ActiveRecord::Migration
  def change
    remove_column :courses, :disabled
  end
end
