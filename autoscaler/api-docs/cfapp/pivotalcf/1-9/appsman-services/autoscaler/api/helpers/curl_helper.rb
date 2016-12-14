require 'json'

class CurlHelper
  DeveloperError = Class.new(StandardError)

  BASH_NEWLINE = " \\ \n\t".freeze
  JSON_CONTENT_TYPE = 'application/json'.freeze
  VALID_HTTP_VERBS = ['GET', 'POST', 'PUT', 'DELETE', 'PATCH'].freeze

  def initialize(endpoint:, verb:, data: nil, content_type: nil, file_arg: nil, output_arg: nil, authenticated: true)
    @endpoint = endpoint.to_s
    @version = ''

    @verb = verb
    @file_arg = file_arg
    @data = data
    @content_type = content_type
    @output_arg = output_arg
    @authenticated = authenticated

    validate_input!
  end

  def render
    [ base_curl,
      verb_arg,
      auth_header,
      content_type_arg,
      file_arg,
      data_arg,
    ].compact.reject(&:empty?).join(BASH_NEWLINE)
  end

  private

  def base_curl
    @output_arg.nil? ? "curl #{url}" : "curl -o #{@output_arg} #{url}"
  end

  def data_arg
    @data.nil? ? nil : "-d '#{@data}'"
  end

  def content_type_arg
    @content_type.nil? ? nil : "-H \"Content-Type: #{@content_type}\""
  end

  def validate_input!
    is_data_valid_json = !!JSON.parse(@data) rescue false

    {
      'Endpoint is required'           => @endpoint.empty?,
      'Endpoint must start with a "/"' => @endpoint[0] != '/',
      'Verb must be a valid HTTP Verb' => !VALID_HTTP_VERBS.include?(@verb),
      'Version must not start with a slash' => @version[0] == '/',
      # 'Data cannot be a GET'           => (!@data.nil? && @verb == 'GET' ),
      'Content type can only be JSON or empty'  => (![JSON_CONTENT_TYPE, nil].include?(@content_type)),
      'JSON data must be valid json'   => (@content_type == JSON_CONTENT_TYPE && !is_data_valid_json)
    }.each do |message, is_invalid|
      raise DeveloperError.new(message) if is_invalid
    end
  end

  def file_arg
    @file_arg.nil? ? nil : "-F '#{@file_arg}'"
  end

  def url
    version_resouce = @version.empty? ? @version : "/#{@version}"

    "\"https://example.com/api#{version_resouce}#{@endpoint}\""
  end

  def verb_arg
    "-X #{@verb}"
  end

  def auth_header
    '-H "Authorization: Bearer UAA_ACCESS_TOKEN"' if @authenticated
  end

end 
