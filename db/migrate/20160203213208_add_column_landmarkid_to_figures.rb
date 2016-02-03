class AddColumnLandmarkidToFigures < ActiveRecord::Migration
  def change
    add_column :figures, :landmark_id, :integer
  end
end
