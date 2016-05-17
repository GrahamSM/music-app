class AddEmbeddableUrl < ActiveRecord::Migration
  def change
    add_column(:tracks, :embeddable_url, :string)
  end
end
