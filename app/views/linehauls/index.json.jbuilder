json.array!(@linehauls) do |linehaul|
  json.extract! linehaul, :id, :route
  json.url linehaul_url(linehaul, format: :json)
end
