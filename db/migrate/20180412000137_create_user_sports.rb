class CreateUserSports < ActiveRecord::Migration[5.1]
  def change
    create_table :user_sports do |t|
      t.integer :user_id
      t.integer :sport_id
      t.integer :sport_level
      t.text :summary

      t.timestamps
    end
  end
end
