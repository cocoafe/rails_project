json.array!(@families) do |family|
  json.extract! family, :id, :product_family
  json.url family_url(family, format: :json)
end
