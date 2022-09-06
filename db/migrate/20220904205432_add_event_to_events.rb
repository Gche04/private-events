class AddEventToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :event, :string
  end
end
