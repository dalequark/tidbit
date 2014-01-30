class CreateQuestionCategories < ActiveRecord::Migration
  def change
    create_table :questions_categories do |t|
      t.belongs_to :question, index: true
      t.belongs_to :category, index: true

      t.timestamps
    end
  end
end
