class Post < ApplicationRecord
  validates :title, :image_url,:content, presence: true
  validates :image_url, format: {with: /\.(png|jpg)\Z/i} 
  before_save :censor

  def censor
    self.content = self.content.gsub('spoiler', '')
  end
end
