class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.integer :user_id
      t.integer :event_id
      t.boolean :accepted
      t.string :message

      t.timestamps
    end
  end
end
