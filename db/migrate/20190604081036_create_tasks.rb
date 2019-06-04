class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :descripion
      t.boolean :active

      t.timestamps
    end
  end
end
