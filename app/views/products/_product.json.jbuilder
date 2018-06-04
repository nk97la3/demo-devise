json.extract! product, :id, :title, :opening, :body, :conclusion, :aboutauthor, :created_at, :updated_at
json.url product_url(product, format: :json)
