class CreateHorses < ActiveRecord::Migration
  def change
    create_table :horses do |t|
      t.string :name
      t.string :photo
      t.text :comment

      t.timestamps null: false
    end
  end
end
