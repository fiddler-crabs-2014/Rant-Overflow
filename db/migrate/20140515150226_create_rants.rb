class CreateRants < ActiveRecord::Migration
  def change
    create_table :rants do |t|

      t.timestamps
    end
  end
end
