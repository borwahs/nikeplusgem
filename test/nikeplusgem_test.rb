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

  def test_create_qs_params_hash_method
    include_params = ["access_token"]

    query_string_params = @client.create_qs_params_hash({"test" => "one"})
    assert query_string_params.has_key?("access_token")
    assert query_string_params.has_key?("test")

    query_string_params = @client.create_qs_params_hash()
    assert query_string_params.has_key?("access_token")
    refute query_string_params.has_key?("test")
  end

  def test_hash_extension_only_method
    include_params = ["param1", "param3", "Param5", "PaRam6"]
    test_params = { "param1" => 1, "param2" => 2, "param3" => 3, "param4" => 4, "param5" => 5, "PaRam6" => 6}

    final_params = test_params.only(include_params)

    assert final_params.has_key? "param1"
    assert final_params.has_key? "param3"
    assert final_params.has_key? "PaRam6"

    refute final_params.has_key? "param2"
    refute final_params.has_key? "param4"
    refute final_params.has_key? "param5"
  end

  def test_helpers_format_date
    date_value = "2013/06/21"
    date = NikePlusGem::Helpers.format_date(date_value)

    assert date.is_a?(String), "Format Date did not return a String object."
    assert date.eql?("2013/06/21"), "Format Date did not set Date correctly."

    date_value = "yyyy/mm/dd"
    date = NikePlusGem::Helpers.format_date(date_value)

    assert date.is_a?(String), "Format Date should return a String object"
    assert date.eql?("ERROR"), "Format Date should return ERROR when the date is invalid."

    date_value = Date.new(2013,6,21)
    date = NikePlusGem::Helpers.format_date(date_value)

    assert date.is_a?(String), "Format Date should return a String object"
    assert date.eql?("2013/06/21"), "Format Date did not set Date correctly."

    date_value = "2013/06/21 12:12:12 PM"
    date = NikePlusGem::Helpers.format_date(date_value)

    assert date.is_a?(String), "Format Date did not return a String object."
    assert date.eql?("2013/06/21"), "Format Date did not set Date correctly."
  end

end