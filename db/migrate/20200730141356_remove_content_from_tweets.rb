class RemoveContentFromTweets < ActiveRecord::Migration[6.0]
  def change
    remove_column :tweets, :content, :string
  end
end
