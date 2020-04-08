class CreateSegments < ActiveRecord::Migration[6.0]
  def change
    create_table :segments do |t|
      t.integer :episode_id
      t.timestamps
    end
  end
end
