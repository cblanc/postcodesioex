defmodule Postcodesio.Postcodes do
	@resource "/postcodes"

	@doc """
  Retrieves data for a given postcode

  Returns postcode map or `nil` if postcode does not exist

  ## Examples

      iex> Postcodesio.Postcodes.get("SW1A 2AA")
			%{admin_county: nil, admin_district: "Westminster", admin_ward: "St James's",
			ccg: "NHS Central London (Westminster)",
			codes: %{admin_county: "E99999999", admin_district: "E09000033",
			admin_ward: "E05000644", ccg: "E38000031", nuts: "UKI32",
			parish: "E43000236"}, country: "England", eastings: 530047,
			european_electoral_region: "London", incode: "2AA",
			latitude: 51.5035398826274, longitude: -0.127695242183412,
			lsoa: "Westminster 018C", msoa: "Westminster 018", nhs_ha: "London",
			northings: 179951, nuts: "Westminster", outcode: "SW1A",
			parish: "Westminster, unparished area",
			parliamentary_constituency: "Cities of London and Westminster",
			postcode: "SW1A 2AA", primary_care_trust: "Westminster", quality: 1,
			region: "London"}

			iex> Postcodesio.Postcodes.get("FOO")
			nil
  """
	def get(postcode) do
		search_term = String.replace(postcode, ~r/ /i, "") |> String.upcase
		URI.encode("/#{@resource}/#{search_term}") |> Postcodesio.get
	end
end
