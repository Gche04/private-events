class AddDateToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :event_date, :date
    add_column :events, :event_time, :time
  end
end
