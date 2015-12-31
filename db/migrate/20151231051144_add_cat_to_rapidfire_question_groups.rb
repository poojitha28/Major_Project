class AddCatToRapidfireQuestionGroups < ActiveRecord::Migration
  def change
    add_column :rapidfire_question_groups, :category, :string
  end
end
