class AddArtist < ActiveRecord::Migration
  def change
    add_column(:tracks, :artist, :string, default: "unkown" )
  end
end
