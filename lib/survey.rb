class Survey < ActiveRecord:: Base
  has_many(:questions)
  before_save(:uppercase_description)
  private

  define_method(:uppercase_description) do
    self.description = self.description().upcase()
  end
end
