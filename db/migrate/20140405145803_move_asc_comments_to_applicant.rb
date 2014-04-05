class MoveAscCommentsToApplicant < ActiveRecord::Migration
  def change
    remove_column :positions, :asc_comments
    add_column :applicants, :asc_comments, :string
  end
end
