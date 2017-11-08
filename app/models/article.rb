class Article < ActiveRecord::Base
  has_attached_file :banner_image, styles: { medium: "700x450>"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :banner_image, content_type: /\Aimage\/.*\z/
  belongs_to :user  
  before_save :title_all_caps, if: lambda {|article| article.title.present? and article.title_changed? }
  before_save :url_title, if: lambda {|article| article.title.present? and article.title_changed? }
  enum status: [:inactive, :active]
  scope :active, -> { where(status: [1]) }
  def title_all_caps
    self.title = self.title.upcase
  end

  def url_title
	self.url_title = self.title.downcase.tr(' ','-').gsub(/\W|_/, '')
  end
  
end
