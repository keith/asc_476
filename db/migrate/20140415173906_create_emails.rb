class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.text :body
      t.string :subject
      t.string :reply_to
      t.string :identifier

      t.timestamps
    end
  end
end
