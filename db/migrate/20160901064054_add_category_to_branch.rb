class AddCategoryToBranch < ActiveRecord::Migration
  def change
    add_column :branches, :category, :string
  end
end
