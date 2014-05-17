class CreateRants < ActiveRecord::Migration
  def change
    create_table :rants do |t|
      t.string :title, :required => true
      t.string :body, :required => true, :limit => 1000
      t.integer :view_count, default: 0
      t.integer :vote_count, default: 0
      t.belongs_to :user
      t.timestamps
    end
  end
end
