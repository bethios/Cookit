class Question < ActiveRecord::Base
  has_many :answers, dependant: :destroy
end
