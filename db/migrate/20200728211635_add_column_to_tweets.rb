class AddColumnToTweets < ActiveRecord::Migration[6.0]
  def change
    add_column :tweets, :topic_id, :integer
  end
end
