class AddProfileUrlToHorse < ActiveRecord::Migration
  def change
    add_column :horses, :profile_url, :string
  end
end
