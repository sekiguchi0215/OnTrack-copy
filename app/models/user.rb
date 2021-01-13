class User < ApplicationRecord

	def password=(value)
		super(BCrypt::Password.create(value))
	end

	def username=(value)
		super(BCrypt::Password.create(value))
	end

	#BCrypt(ビークリプト)とはパスワードをハッシュ化するための関数を提供するgem。
	#Gemfileにコメント付きで書いてあるため、コメントアウトを外してインストールできる。
end
