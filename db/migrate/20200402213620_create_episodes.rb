class CreateEpisodes < ActiveRecord::Migration[6.0]
  def change
    create_table :episodes do |t|
      t.string :title
      t.string :air_date
      t.belongs_to :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
