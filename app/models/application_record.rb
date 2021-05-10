class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  # any custom method you want to share across all the model files goes here
end
