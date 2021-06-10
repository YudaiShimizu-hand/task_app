class Task < ApplicationRecord
     belongs_to :user

     scope :recent, -> { order(created_at) }
     #繰り返し使用される絞り込み条件をスッキリ
end
