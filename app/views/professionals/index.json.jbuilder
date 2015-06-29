json.array!(@professionals) do |professional|
  json.extract! professional, :id, :first_name, :last_name, :address, :phone_number, :specialty
  json.url professional_url(professional, format: :json)
end
