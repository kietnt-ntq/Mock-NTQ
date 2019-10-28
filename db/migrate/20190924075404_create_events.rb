class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string     :title
      t.string     :thumbnail
      t.string     :content
      t.text       :document
      t.datetime   :startDate
      t.datetime   :endDate
      t.float    :duration
      t.string     :color
      t.text       :speaker
      t.string     :something
      t.references :user, foreign_key: true
      t.references :group, foreign_key: true
      t.references :content, foreign_key: true
      t.timestamps
    end
  end
end
