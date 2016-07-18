class Division < ActiveRecord::Base
  has_many(:employees)
  validates(:name, {:presence => true, :length => { :maximum => 50}})
end
