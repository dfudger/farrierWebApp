class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.text :comment
      t.datetime :start
      t.datetime :end
      t.string :location

      t.timestamps null: false
    end
  end
end
