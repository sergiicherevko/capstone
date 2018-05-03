class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.integer :user_id
      t.string :address
      t.string :available_datetime
      t.integer :sport_id
      t.string :description

      t.timestamps
    end
  end
end
