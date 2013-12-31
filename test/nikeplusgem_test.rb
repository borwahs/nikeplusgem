require 'test/unit'
require 'nikeplusgem'

class NikePlusGemTest < Test::Unit::TestCase
	def test_required_params_client_obj
		access_token = "12345"
		app_id = "abcdef"

		client = NikePlusGem::Client.new(access_token, app_id)

		assert_equal access_token, client.access_token, "Access Token is not set correctly"
		assert_equal app_id, client.app_id, "App ID is not set correctly"
	end
end