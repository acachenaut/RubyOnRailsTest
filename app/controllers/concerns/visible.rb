module Visible
  extend ActiveSupport::Concern

  VALID_STATUSES = ['public', 'private', 'archived']

  included do
    validates :status, inclusion: { in: VALID_STATUSES }
  end

  class_methods do
    def public_count
      where(status: 'public').count
    end
  end

  class_methods do
    def noteAvg(art)
      sum = 0.0
      art.notes.each do |note|
        sum += note.note
      end
      if (art.notes.count == 0)
        then return 0
        else return sum/art.notes.count
      end
    end
  end

  def archived?
    status == 'archived'
  end
end
