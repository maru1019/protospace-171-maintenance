class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references   :user_id, null: false
      t.references   :prototype_id, null: false, foreign_key: true
      t.text         :content, null: false, foreign_key: true
      t.timestamps
    end
  end
end
