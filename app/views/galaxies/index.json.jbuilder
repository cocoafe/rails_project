json.array!(@galaxies) do |galaxy|
  json.extract! galaxy, :id, :galaxy_name
  json.url galaxy_url(galaxy, format: :json)
end
