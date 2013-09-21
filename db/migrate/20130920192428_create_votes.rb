class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :votable_id
      t.string :votable_type
      t.boolean :is_upvote
      t.belongs_to :user

      t.timestamps
    end
  end
end