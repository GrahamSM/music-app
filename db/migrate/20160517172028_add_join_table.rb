class AddJoinTable < ActiveRecord::Migration
  def change
    create_join_table :tracks, :users, table_name: :upvotes do |t|
      t.index :track_id
      t.index :user_id
    end
  end
end
