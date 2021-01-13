class Category < ApplicationRecord

	#値が空でないかのバリデーション。今回は2種のカラムに適応。
	validates_presence_of :name, :color

	has_many :expenses
end
