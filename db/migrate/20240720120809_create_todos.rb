class CreateTodos < ActiveRecord::Migration[7.0]
  def change
    create_table :todos do |t|
      t.text :title
      t.boolean :is_done

      t.timestamps
    end
  end
end
