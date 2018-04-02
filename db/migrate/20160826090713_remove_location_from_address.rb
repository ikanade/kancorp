class RemoveLocationFromAddress < ActiveRecord::Migration
  def change
    remove_column :addresses, :location, :string
  end
end
