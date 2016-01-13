class AddHorseRefToAppointments < ActiveRecord::Migration
  def change
    add_reference :appointments, :horse, index: true, foreign_key: true
  end
end
