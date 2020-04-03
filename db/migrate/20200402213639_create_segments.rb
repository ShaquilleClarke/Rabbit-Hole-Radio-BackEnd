class CreateSegments < ActiveRecord::Migration[6.0]
  def change
    create_table :segments do |t|
      t.string :title
      t.belongs_to :episode, null: false, foreign_key: true
      t.timestamps
    end
  end
end
