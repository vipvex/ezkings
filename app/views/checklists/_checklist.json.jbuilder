json.extract! checklist, :id, :name, :content, :order, :created_at, :updated_at
json.url checklist_url(checklist, format: :json)