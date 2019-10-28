class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :slug
      t.string :decription
      t.string :picture
      t.string :cover
      t.date   :startdate
      t.references :course, foreign_key: true

      t.timestamps
    end
    add_index :groups, [:course_id, :created_at]
  end
end
