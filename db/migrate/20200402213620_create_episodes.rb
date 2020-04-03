class CreateEpisodes < ActiveRecord::Migration[6.0]
  def change
    create_table :episodes do |t|
      t.string :title
      t.string :air_date
      t.integer :user_id
      t.timestamps
    end
  end
end
