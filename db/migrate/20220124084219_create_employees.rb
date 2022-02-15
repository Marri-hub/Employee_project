class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :department
      t.bigint :salary

      t.timestamps
    end
  end
end
