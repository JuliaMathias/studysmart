class CreateAttachments < ActiveRecord::Migration[6.0]
  def change
    create_table :attachments do |t|
      t.string :name
      t.string :url
      t.integer :attachment_type
      t.references :session, null: false, foreign_key: true

      t.timestamps
    end
  end
end
