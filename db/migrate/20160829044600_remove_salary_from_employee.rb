class RemoveSalaryFromEmployee < ActiveRecord::Migration
  def change
  	remove_reference :employees, :salary, index: true, foreign_key: true
  end
end
