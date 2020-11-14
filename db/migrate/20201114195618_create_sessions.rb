class CreateSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :sessions do |t|
      t.string :name
      t.datetime :date
      t.text :content
      t.string :video_call
      t.boolean :privacy
      t.references :study_group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
