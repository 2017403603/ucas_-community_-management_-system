class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :email
      t.string :password
      t.integer :role
      t.integer :status

      t.timestamps
    end
  end
end
