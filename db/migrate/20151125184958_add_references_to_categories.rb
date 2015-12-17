class AddReferencesToCategories < ActiveRecord::Migration
  def change
  	add_reference :categories, :user
  end
end
