class ChangeEmailAndPhoneInEmployee < ActiveRecord::Migration
  def change
  	add_index :employees, :phone , :unique => true 
  	add_index :employees, :email , :unique => true
  end
end
