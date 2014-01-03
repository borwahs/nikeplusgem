require 'test/unit'
require 'nikeplusgem'

class NikePlusGemTest < Test::Unit::TestCase
  def setup
    @access_token = "12345"
    @app_id = "abcdef"

    @client = NikePlusGem::Client.new(@access_token, @app_id)
  end

	def test_required_params_client_obj
		assert_equal @access_token, @client.access_token, "Access Token is not set correctly."
		assert_equal @app_id, @client.app_id, "App ID is not set correctly."
	end

	def test_required_headers_returned
    headers = @client.build_headers

    assert headers.key?("appid"), "App ID needs to be automatically added to headers."
    assert headers.key?("Accept"), "Accept key needs to be set in header."
	end

  def test_headers_merge
    headers = @client.build_headers({"test" => "value", "test2" => "value2"})

    assert headers.key?("appid"), "App ID needs to be automatically added to headers even when merged."
    assert headers.key?("Accept"), "Accept key needs to be set in header even when merged."

    assert headers.key?("test"), "Header key (test) was not merged."
    assert headers.key?("test2"), "Header key (test2) was not merged."
  end

  def test_headers_overwrite_req_params
    headers = @client.build_headers({"test" => "value", "appid" => "zyxwv"})

    assert headers.key?("appid"), "App ID needs to be automatically added to headers even when merged."
    assert headers.key?("Accept"), "Accept key needs to be set in header even when merged."
    assert headers.key?("test"), "Header key (test) was not merged."

    assert_equal headers["appid"], "zyxwv", "App ID should be replaced when calling build_headers."
  end

  def test_parameterize
    parameters = @client.parameterize({})
    assert_equal parameters, "", "Trying to parameterize no key/values should return an empty string."

    parameters = @client.parameterize({"key1" => "value1"})
    assert_equal parameters, "key1=value1", "Did not build Query String parameters for one key/value."

    parameters = @client.parameterize({"key1" => "value1", "key2" => "value2"})
    assert_equal parameters, "key1=value1&key2=value2", "Did not build Query String parameters for two key values."
  end

  def test_generate_uri
    uri = @client.generate_uri("endpoint")
    assert uri.to_s.include?("access_token=12345"), "Generate URI must include the Access Token QS param"

    uri = @client.generate_uri("endpoint", {"count" => 5})
    assert uri.to_s.include?("access_token=12345"), "Generate URI must include the Access Token QS param"
    assert uri.to_s.include?("count=5"), "Generate URI must include the Count QS param"
  end
end