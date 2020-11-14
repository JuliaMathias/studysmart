class CreateUserStudyGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :user_study_groups do |t|
      t.references :user, null: false, foreign_key: true
      t.references :study_group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
