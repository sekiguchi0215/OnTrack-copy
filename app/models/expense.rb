class Expense < ApplicationRecord
	
	#値が空でないかのバリデーション。今回は4種のカラムに適応。
	validates_presence_of :description, :amount, :category_id, :paid_at

	belongs_to :category
end
