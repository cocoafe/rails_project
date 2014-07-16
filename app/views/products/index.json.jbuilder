json.array!(@products) do |product|
  json.extract! product, :id, :product_name, :family_id
  json.url product_url(product, format: :json)
end
