class CreateCLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :c_likes do |t|
      t.references :claimer, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
