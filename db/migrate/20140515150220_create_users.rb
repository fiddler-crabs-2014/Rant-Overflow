class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, :required => true
      t.string :password, :required => true
      t.timestamps
    end
  end
end
