class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :num  #学号
      t.integer :role
      t.integer :status
      t.integer :school #学院

      t.timestamps
    end
  end
end
