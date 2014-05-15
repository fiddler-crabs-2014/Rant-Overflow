class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :body
      t.belongs_to :rant
      t.belongs_to :user
      t.timestamps
    end
  end
end
