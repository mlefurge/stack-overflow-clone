class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string   :content, null: false
      t.integer  :question_id, null: false
      t.integer  :user_id, null: false
      t.boolean  :best, default: false, null: false

      t.timestamps null: false
    end
  end
end
