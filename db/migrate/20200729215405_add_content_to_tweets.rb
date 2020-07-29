class AddContentToTweets < ActiveRecord::Migration[6.0]
  def change
    add_column :tweets, :content, :string
  end
end
