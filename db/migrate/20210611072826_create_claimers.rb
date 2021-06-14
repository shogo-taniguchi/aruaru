class CreateClaimers < ActiveRecord::Migration[6.1]
  def change
    create_table :claimers do |t|
      t.text :body_c

      t.timestamps
    end
  end
end
