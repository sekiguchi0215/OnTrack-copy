class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.text :name, null: false
      t.string :color, null: false
      t.integer :monthly_goal, dafault: 0
      t.timestamps
    end
  end
end
