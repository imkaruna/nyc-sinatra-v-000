class FigureTitles < ActiveRecord::Base
  belongs_to :figures
  belongs_to :titles
end
