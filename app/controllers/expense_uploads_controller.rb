require "csv"

class ExpenseUploadsController < ApplicationController
	def new
		@categories = Category.all.order(:name)
	end

	def create
		default_category_id = params[:default_category_id].to_i 
		# "to_i メソッド" は文字列を整数に変換するメソッド。"to_s メソッド" という、数値を文字列に変換するメソッドもある。
		amount_idx = params[:amount_col].to_i - 1
		paid_date_idx = params[:paid_date_col].to_i - 1
		description_idx = params[:description_col].to_i - 1
		categroy_idx = params[:category_col].to_i - 1
		file_contents = File.read(params[:file].tempfile)
		csv = CSV.parse(file_contents)

		searched_categories = {}
		csv.each do |row|
			amount = row[amount_idx].to_f.abs * 100
			# "to_f メソッド" は 浮動小数点数として変換される。浮動小数点数として認識されない場合は、0.0が返ってくる。
			# 『浮動小数点数とは？・・・一言で言えば、計算で誤差が発生することを前提とした数値データのこと。』らしい。
			# 浮動小数点数は、固定小数点（整数データ）よりはるかに広い範囲の数を扱うことができる。
			# 参考記事（https://qiita.com/angel_p_57/items/24078ba4aa5881805ab2）（https://dangerous-animal141.hatenablog.com/entry/2014/05/10/000000）
			next if amount == 0
			# "next if" は、指定した条件の処理をスキップできる。 "break" とは違い、スキップした後もループは続く。
			paid_at = Chronic.parse(row[paid_date_idx])
			description = row[description_idx]

			category_id = default_category_id
			if categroy_idx >= 0
				category = row[category_idx]
				if category.present? # "present?" は、オブジェクトが存在すれば true、存在しなければ falseを返すメソッド。
					searched_categories[category] = Category.find_by("lower(name) = ?", category.downcase).try(:id) || default_category_id if searched_categories[category].nil?
					# "nil?" は、オブジェクト自体が存在していないなら true、存在しているなら falseを返すメソッド。
					category_id = searched_categories[category]
				end
			end

			Expense.create!(amount: amount, paid_at: paid_at, description: description, category_id: category_id)
		end

		redirect_to expenses_path
	end
end
