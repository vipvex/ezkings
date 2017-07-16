json.extract! shipping_option, :id, :name, :price, :order, :created_at, :updated_at
json.url shipping_option_url(shipping_option, format: :json)