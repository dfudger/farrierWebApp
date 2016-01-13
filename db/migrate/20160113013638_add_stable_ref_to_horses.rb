class AddStableRefToHorses < ActiveRecord::Migration
  def change
    add_reference :horses, :stable, index: true, foreign_key: true
  end
end
