class AddArtist < ActiveRecord::Migration
  def change
    add_column(:tracks, :artist, :string)
  end
end