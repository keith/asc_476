class ChangeCourseNumberToString < ActiveRecord::Migration
  def change
    change_column :courses, :number, :string
  end
end
