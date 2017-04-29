class Figure < ActiveRecord::Base
  has_many :landmarks
  has_many :figure_titles
  has_many :titles, through: :figure_titles

  def title_ids=(title_ids)
    FigureTitle.destroy_all(figure_id: self.id)
    title_ids.delete("x")
    title_ids.each {|id| FigureTitle.find_or_create_by(title_id: id, figure_id: self.id)}
  end

  def landmark_ids=(landmark_ids)
    Landmark.where(figure_id: self.id).update_all(figure_id: nil)
    landmark_ids.delete("x")
    landmark_ids.each {|id| Landmark.find(id).update(figure_id: self.id)}
  end

end
