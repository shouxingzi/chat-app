class CreateRoomUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :room_users do |t|
      t.references :room, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end

# foreign_key
# roomテーブル、userテーブルから外部キー制約を設けている。

# references型
# 外部キーのカラムを追加する時に用いる型。