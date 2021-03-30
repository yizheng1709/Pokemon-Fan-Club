class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :content
      t.string :release_date
      t.string :image

      t.timestamps
    end
  end
end
