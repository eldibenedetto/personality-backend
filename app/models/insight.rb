class Insight < ActiveRecord::Base

belongs_to :insightable, polymorphic: true

end
