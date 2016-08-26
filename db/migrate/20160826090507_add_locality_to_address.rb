class AddLocalityToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :locality, :text
  end
end
