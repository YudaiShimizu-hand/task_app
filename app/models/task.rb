class Task < ApplicationRecord
     belongs_to :user

     validates :name, presence: true
     validates :description, presence: true

     scope :recent, -> { order(created_at: :desc) }
     #繰り返し使用される絞り込み条件をスッキリ
end
