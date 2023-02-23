class Articles::List < Articles::Base
  def call
    data = api_request(API_URL, options)
    response = api_response(data)
    likes_group = likes.group_by(&:resource_id)
    response.map!{ |article| article.merge(likes_count: likes_group[article["id"]]&.first&.count) }
  end

  private

  def likes
    Like.where(resource_type: "Article")
  end
end
