json.array!(@appointments) do |appointment|
  json.extract! appointment, :id, :comment, :start, :end, :location
  json.url appointment_url(appointment, format: :json)
end
