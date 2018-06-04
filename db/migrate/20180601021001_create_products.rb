class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title
      t.string :opening
      t.string :body
      t.string :conclusion
      t.string :aboutauthor

      t.timestamps
    end
  end
end
