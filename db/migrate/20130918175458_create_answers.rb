class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :rating
      t.string :content
      t.belongs_to :user
      t.belongs_to :question

      t.timestamps
    end
  end
end
