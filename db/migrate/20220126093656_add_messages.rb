class AddMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.json :payload

      t.timestamps
    end
  end
end
