class CreateRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :roles do |t|
      t.references :user, foreign_key: true
      t.references :group, foreign_key: true
      t.string  :roles
      t.string  :status

      t.timestamps
    end
  end
end
