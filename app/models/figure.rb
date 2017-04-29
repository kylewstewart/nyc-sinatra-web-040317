class Figure < ActiveRecord::Base
  has_many :landmarks
  has_many :figure_titles
  has_many :titles, through: :figure_titles

  def title_ids=(title_ids)
    title_ids.each do |id|
      FigureTitle.create(title_id: id, figure_id: self.id) unless id == "x"
    end
  end

  def landmark_ids=(landmark_ids)
    landmark_ids.each do|id|
      landmark = Landmark.find(id) unless id == "x"
      landmark.update(figure_id: self.id) unless id == "x"
    end
  end

end
