class AddIndexEmployeesOnEmailAndColumnId < ActiveRecord::Migration
  def change
  	add_index :employees, [:email,:company_id], unique:true
  	add_index :employees, [:phone,:company_id], unique:true
  end
end
