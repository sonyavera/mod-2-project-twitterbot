class Topic < ActiveRecord::Migration[6.0]
  def change
    create_table :topics do |t|
    t.string :name
    end
  end
end
