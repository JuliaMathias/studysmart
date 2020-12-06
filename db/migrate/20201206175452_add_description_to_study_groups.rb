class AddDescriptionToStudyGroups < ActiveRecord::Migration[6.0]
  def change
    add_column :study_groups, :description, :text
  end
end
