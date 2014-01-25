class CreateTodoCategories < ActiveRecord::Migration
  def change
    create_table :todo_categories do |t|
      t.string :name, :null => false

      t.timestamps
    end
  end
end
