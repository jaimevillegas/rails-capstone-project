class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :name
      t.float :amount

      t.timestamps
    end
  end
end
