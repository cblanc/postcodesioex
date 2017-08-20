defmodule Postcodesio.PostcodesTest do
	use ExUnit.Case

	test "Postcode retrieval" do
		case Postcodesio.Postcodes.get("SW1A 2AA") do
			{:error, error} -> flunk error
			result -> 
				assert result[:postcode] == "SW1A 2AA"
		end
	end

	test "case sensitivity" do
		case Postcodesio.Postcodes.get("sw1a 2aa") do
			{:error, error} -> flunk error
			result -> 
				assert result[:postcode] == "SW1A 2AA"
		end
	end

	test "space sensitivity" do
		case Postcodesio.Postcodes.get("SW1A2AA") do
			{:error, error} -> flunk error
			result -> 
				assert result[:postcode] == "SW1A 2AA"
		end
	end

	test "Invalid postcode retrieval" do
		assert Postcodesio.Postcodes.get("FOO") == nil
	end
end
