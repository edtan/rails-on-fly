class AddRegionToChirps < ActiveRecord::Migration[6.1]
  def change
    add_column :chirps, :region, :string
  end
end
