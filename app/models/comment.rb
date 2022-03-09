class Comment < ApplicationRecord
  belongs_to :item
  belongs_to :customer
  
  validates :rate, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 0.5}, presence: true
    
  def avg_score
    unless self.comments.empty?
      comments.average(:rate_id).round(1)
    else
      0.0
    end
  end  
  
  def avg_score_percentage
   unless self.comments.empty?
     comments.average(:rate_id).round(1).to_f*100/5
   else
     0.0
   end
 end
end
