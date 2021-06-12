class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: false  #空で投稿できない
      t.string :email, null: false
      t.string :password_digest

      t.timestamps
      t.index :email, unique: true #同じメールアドレスが複数にいることを阻止
    end
  end
end
