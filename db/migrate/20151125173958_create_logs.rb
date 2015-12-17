class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.integer :number
      t.references :user, index: true, foreign_key: true
      t.references :project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
