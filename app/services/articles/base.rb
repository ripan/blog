require "net/http"
class Articles::Base < ApplicationService
  API_URL = "https://s3-eu-west-1.amazonaws.com/olio-staging-images/developer/test-articles-v4.json".freeze

  ALL_NET_HTTP_ERRORS = [Timeout::Error, Errno::EINVAL, Errno::ECONNRESET, EOFError, Net::HTTPBadResponse,
                         Net::HTTPHeaderSyntaxError, Net::ProtocolError].freeze

  attr_reader :options

  def initialize(options = {})
    @options = options
  end

  private

  def api_request(api_uri, query_params)
    uri = URI(api_uri)
    uri.query = URI.encode_www_form(query_params)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(uri)

    http.request(request)
  rescue *ALL_NET_HTTP_ERRORS => e
    ExceptionNotifier.notify_exception(e)
  end

  def api_response(response)
    case response
    when Net::HTTPSuccess
      JSON.parse response.read_body
    else
      raise response.value
    end
  end
end