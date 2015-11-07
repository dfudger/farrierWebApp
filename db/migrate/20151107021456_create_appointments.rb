class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.text :comment
      t.datetime :start
      t.datetime :end
      t.string :location
      t.references :horse, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
