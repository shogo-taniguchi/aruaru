class CreateCComments < ActiveRecord::Migration[6.1]
  def change
    create_table :c_comments do |t|
      t.string :content
      t.references :user, null: false, foreign_key: true
      t.references :claimer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
