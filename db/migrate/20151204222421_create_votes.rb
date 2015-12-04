class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer  :total, default: 0, null: false
      t.string   :votable_type, null: false
      t.integer  :votable_id, null:false
      t.integer  :user_id, null: false
      t.integer  :value

      t.timestamps null:false
    end
  end
end
