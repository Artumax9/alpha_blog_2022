class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      #details
      t.string :title #title attirbute
      t.text :description
      
    end
  end
end
