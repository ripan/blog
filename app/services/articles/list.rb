class Articles::List < Articles::Base
  def call
    data = api_request(API_URL, options)
    api_response(data)
  end
end
