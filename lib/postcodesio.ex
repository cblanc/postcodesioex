defmodule Postcodesio do
  @moduledoc """
  Elixir client for postcodes.io API
  """

  @api "https://api.postcodes.io"

  use HTTPoison.Base

  def get(endpoint) do
    url = @api <> endpoint
    case Postcodesio.get!(url) do
      {:error, error} -> {:error, error}
      response -> response.body 
        |> parse_json
        |> parse_response
    end
  end

  defp parse_json(data) do
    Poison.decode!(data, keys: :atoms)
  end

  defp parse_response(response) do
    status = response[:status]
    case status do
      200 -> response[:result]
      404 -> nil
      _ -> { :error, "#{status} error code returned" }
    end
  end
end
