class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :description
      t.string :type
      t.date :release_date
      t.string :rating
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
