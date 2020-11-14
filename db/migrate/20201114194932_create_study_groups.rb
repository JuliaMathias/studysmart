class CreateStudyGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :study_groups do |t|
      t.integer :creator_id
      t.string :name
      t.boolean :create_sessions
      t.boolean :edit_session

      t.timestamps
    end
  end
end
