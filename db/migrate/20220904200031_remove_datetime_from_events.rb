class RemoveDatetimeFromEvents < ActiveRecord::Migration[7.0]
  def change
    remove_column :events, :starts_at, :datetime
  end
end
