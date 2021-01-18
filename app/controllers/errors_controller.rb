class ErrorsController < ApplicationController
	skip_before_action :require_login

	def not_found
		render status: 400 # ":bad_request"
		# :status オプション
		# Railsが返すレスポンスのHTTPステータスコードは自動的に生成される。（ほとんどの場合、 200 :ok となる。）
		# :status オプションを使用することで、レスポンスのステータスコードを変更できる。
		# 参考記事（https://railsguides.jp/layouts_and_rendering.html）
	end

	def unacceptable
		render status: 422 # ":unprocessable_entity"
	end

	def internal_error
		render status: 500 # ":internal_server_error"
	end
end
