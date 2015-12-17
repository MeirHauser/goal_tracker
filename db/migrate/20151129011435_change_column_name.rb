class ChangeColumnName < ActiveRecord::Migration
  def change
  	rename_column :projects, :type, :section
  end
end
