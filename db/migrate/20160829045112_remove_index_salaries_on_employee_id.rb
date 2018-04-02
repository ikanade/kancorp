class RemoveIndexSalariesOnEmployeeId < ActiveRecord::Migration
  def change
    	remove_index "salaries", ["employee_id"]
  end
end
