class CreateQuestionTags < ActiveRecord::Migration
  def change
    create_table :question_tags do |t|
      t.integer  :question_id, null: false, index: true
      t.integer  :tag_id, null: false, index: true

      t.timestamps null: false
    end
  end
end
