class CreatePdus < ActiveRecord::Migration[5.1]
  def change
    create_table :pdus do |t|

      t.timestamps
    end
  end
end
