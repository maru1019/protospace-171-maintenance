class Prototype < ApplicationRecord
  #ユーザー管理機能と統合した際に下記をコメントアウト
  #belongs_to :user
  has_one_attached :image

  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :concept, presence: true
  validates :image, presence: true
end
