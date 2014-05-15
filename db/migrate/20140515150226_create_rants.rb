class CreateRants < ActiveRecord::Migration
  def change
    create_table :rants do |t|
      t.string :title, :required => true
      t.string :body, :required => true
      t.integer :view_count
      t.belongs_to :user
      t.timestamps
    end
  end
end
