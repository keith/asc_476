class AddDescriptionToEmails < ActiveRecord::Migration
  def change
    add_column :emails, :description, :string
  end
end
