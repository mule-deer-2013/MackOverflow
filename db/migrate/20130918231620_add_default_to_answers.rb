class AddDefaultToAnswers < ActiveRecord::Migration
  def change
    change_column :answers, :rating, :integer, :default => 0
  end
end
