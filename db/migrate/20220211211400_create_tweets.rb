class CreateTweets < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :nickname
      t.timestamps
    end
    create_table :tweets do |t|
      t.string     :title
      t.text       :body
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end

