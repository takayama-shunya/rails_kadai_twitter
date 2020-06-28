class Blog < ApplicationRecord
  validates :content, presence: { message: "入力がありません"}
  validates :content, length: 
            { in: 1..140, message: "1~140字以内で入力して下さい"}
end
