class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :rating
      t.string :content
      t.belongs_to :user #alias?

      t.timestamps
    end
  end
end
