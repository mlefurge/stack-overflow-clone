class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string   :title, null: false
      t.integer  :user_id, null: false
      t.text     :content, null: false
      t.integer  :answers_count
      t.integer  :votes_count

      t.timestamps null: false
    end
  end
end
