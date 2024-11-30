class CreateTarefas < ActiveRecord::Migration[8.0]
  def change
    create_table :tarefas do |t|
      t.string :name
      t.integer :custo
      t.date :datalimite
      t.integer :ordem

      t.timestamps
    end
    add_index :tarefas, :ordem, unique: true
  end
end
