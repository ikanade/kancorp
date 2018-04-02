class RemoveIndexEmployeesOnEmail < ActiveRecord::Migration
  def change
  	add_index :employees,[:phone,:email], :unique => true 
  end
end
