class ExpensesController < ApplicationController
	def index
		@category_id = params[:categroy_id].to_json
		@paid_after = params[:paid_after].to_json
		@has_data - Expense.count > 0
		@categories = Category.all.order(:name).to_json
	end
end
