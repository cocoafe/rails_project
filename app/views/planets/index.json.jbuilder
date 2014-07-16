json.array!(@planets) do |planet|
  json.extract! planet, :id, :planet_name, :galaxy_id
  json.url planet_url(planet, format: :json)
end
