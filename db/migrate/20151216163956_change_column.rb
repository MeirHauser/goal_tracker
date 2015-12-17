class ChangeColumn < ActiveRecord::Migration
  def change
  	change_column :projects, :amount, :string
  end
end
