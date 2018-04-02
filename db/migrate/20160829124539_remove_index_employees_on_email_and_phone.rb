class RemoveIndexEmployeesOnEmailAndPhone < ActiveRecord::Migration
  def change
  	  remove_index "employees", ["phone", "email"]
  end
end
