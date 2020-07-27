class CreateTargets < ActiveRecord::Migration[6.0]
  def change
    create_table :targets do |t|
      t.string :name
      t.string :handle

      t.timestamps
    end
  end
end
