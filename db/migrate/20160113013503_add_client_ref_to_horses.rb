class AddClientRefToHorses < ActiveRecord::Migration
  def change
    add_reference :horses, :client, index: true, foreign_key: true
  end
end
