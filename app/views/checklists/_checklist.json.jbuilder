json.extract! checklist, :id, :name, :order, :url, :content, :created_at, :updated_at
json.url checklist_url(checklist, format: :json)