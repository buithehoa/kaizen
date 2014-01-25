class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.integer     :parent_id
      t.string      :title,         :null => false
      t.references  :todo_category

      t.datetime    :completed_at
      t.timestamps
    end
  end
end
