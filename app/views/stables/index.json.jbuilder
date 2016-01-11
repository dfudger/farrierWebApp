json.array!(@stables) do |stable|
  json.extract! stable, :id, :name, :owner, :phoneNo, :address, :email, :comment
  json.url stable_url(stable, format: :json)
end
