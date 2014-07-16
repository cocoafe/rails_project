json.array!(@aliens) do |alien|
  json.extract! alien, :id, :alien_name, :category_id
  json.url alien_url(alien, format: :json)
end
