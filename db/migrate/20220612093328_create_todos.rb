class CreateTodos < ActiveRecord::Migration[7.0]
  def change
    create_table :todos do |t|
      t.references :task, null: false, foreign_key: true
      t.string :name, null: false
      t.boolean :done, null: false, default: false

      t.timestamps
    end
    add_index :todos, [:name, :task_id], unique: true
    add_index :todos, :name
  end
end
