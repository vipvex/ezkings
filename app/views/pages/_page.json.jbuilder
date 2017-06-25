json.extract! page, :id, :name, :url, :content, :layout, :created_at, :updated_at
json.url page_url(page, format: :json)