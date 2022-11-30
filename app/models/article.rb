class Article < ApplicationRecord
  include Visible

  has_many :comments, dependent: :destroy
  has_many :notes, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }

  def noteAvg
    sum = 0.0
    self.notes.each do |note|
      sum += note.note
    end
    if (self.notes.count == 0)
      then return 0
      else return sum/self.notes.count
    end
  end

end
