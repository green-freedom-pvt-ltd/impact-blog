json.array!(@articles) do |article|
  json.extract! article, :id, :content, :short_description, :title, :banner_image, :url_title, :created_at
end
