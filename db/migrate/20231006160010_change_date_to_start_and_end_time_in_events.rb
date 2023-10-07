class ChangeDateToStartAndEndTimeInEvents < ActiveRecord::Migration[7.0]
  def change
    rename_column :events, :date, :start_time
    change_column :events, :start_time, :datetime
    add_column :events, :end_time, :datetime
  end
end
