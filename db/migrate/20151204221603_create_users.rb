class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string   :provider, null: false
      t.string   :uid, null: false
      t.string   :name
      t.string   :oauth_token
      t.datetime :oauth_expires_at
      t.integer  :questions_count
      t.integer :answers_count

      t.timestamps null: false
    end
  end
end
