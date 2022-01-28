class AddColumnsToMessages < ActiveRecord::Migration[6.1]
  def change
    add_column :messages, :channel, :string
    add_column :messages, :text, :string
    add_column :messages, :ts, :string
  end
end
