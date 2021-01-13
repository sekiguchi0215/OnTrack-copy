class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  include Paginator
  #未解決
end
