class CreateAttendanceEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :attendance_events do |t|
      t.references :user, foreign_key: true
      t.references :event, foreign_key: true
      t.string  :note, :default => "đã điểm danh"
      t.string  :status
      t.timestamps
    end
  end
end
