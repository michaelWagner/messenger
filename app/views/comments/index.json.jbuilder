json.array!(@comments) do |comment|
  json.extract! comment, :id, :author_id, :post_id, :body, :title
  json.url comment_url(comment, format: :json)
end
