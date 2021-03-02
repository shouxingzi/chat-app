# messagesテーブルのマイぐれ
class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :content
      t.references :room, foreign_key: true
      # roomsテーブルのidを主キーとする
      t.references :user, foreign_key: true
      # usersテーブルのidを主キーとする

      t.timestamps
    end
  end
end

# 
