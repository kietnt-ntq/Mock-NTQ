class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :slug
      t.string :user_id
      t.string :thumbnail
      
      t.timestamps
    end
  end
end
