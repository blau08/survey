class Question < ActiveRecord:: Base
  belongs_to(:survey)

  validates(:description, {:presence => true, :length => {:maximum => 50}})
end
