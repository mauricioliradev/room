class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.text :description
      t.date :start
      t.date :end
      t.string :color
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
