json.array!(@circles) do |circle|
  json.extract! circle, :id, :user_id, :title
  json.url circle_url(circle, format: :json)
end
