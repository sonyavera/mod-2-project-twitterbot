class AddStatusNumberToTweets < ActiveRecord::Migration[6.0]
  def change
    add_column :tweets, :status_number, :integer
  end
end
