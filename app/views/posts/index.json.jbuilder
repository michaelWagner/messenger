json.array!(@posts) do |post|
  json.extract! post, :id, :author_id, :body, :title
  json.url post_url(post, format: :json)
end
