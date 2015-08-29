class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :address
      t.string :email
      t.string :phone
      t.text :comment

      t.timestamps null: false
    end
  end
end
