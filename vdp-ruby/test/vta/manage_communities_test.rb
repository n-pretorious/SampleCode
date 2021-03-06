require 'test/unit'
require 'rest-client'
require 'json'
require 'yaml'
require File.expand_path('../../../lib/visa_api_client', __FILE__)

class ManageCommunitiesTest < Test::Unit::TestCase
  
  def setup
    @config = YAML.load_file('configuration.yml')
    @visa_api_client = VisaAPIClient.new
  end
  
  def test_getCommunities
    base_uri = 'vta/'
    resource_path = 'v3/communities'
    response_code = @visa_api_client.doMutualAuthRequest("#{base_uri}#{resource_path}", "Get Communities Test", "get", '', {'ServiceId' => @config['vtaServiceId']})
    assert_equal("200", response_code, "Get Communities test failed")
  end
end
