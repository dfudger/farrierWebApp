class CreateStables < ActiveRecord::Migration
  def change
    create_table :stables do |t|
      t.string :name
      t.string :owner
      t.string :phoneNo
      t.string :address
      t.string :email
      t.text :comment

      t.timestamps null: false
    end
  end
end
