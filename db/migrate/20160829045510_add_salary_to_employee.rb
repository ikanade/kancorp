class AddSalaryToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :salary, :integer
  end
end
