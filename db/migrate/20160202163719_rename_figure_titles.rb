class RenameFigureTitles < ActiveRecord::Migration
  def change
    rename_table('figure_titles', 'figures_titles')
  end
end
