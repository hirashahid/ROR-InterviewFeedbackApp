class AddAttributesToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :name, :string
    add_column :users, :empId, :integer
    add_column :users, :phone, :integer
    add_column :users, :user_type, :integer
  end
end
