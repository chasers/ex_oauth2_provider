defmodule ExOauth2Provider.Token.Utils.Response do
  @moduledoc false

  @doc false
  def response(%{access_token: token}) do
    build_response(%{access_token: token})
  end
  def response(%{error: _} = params) do
    build_response(params)
  end

  @doc false
  def revocation_response(%{error: _, should_return_error: true} = params), do: response(params)
  def revocation_response(%{}) do
    {:ok, %{}}
  end

  defp build_response(%{access_token: access_token} = _) do
    {:ok, %{access_token: access_token.token,
            # Access Token type: Bearer.
            # @see https://tools.ietf.org/html/rfc6750
            #   The OAuth 2.0 Authorization Framework: Bearer Token Usage
            token_type: "bearer",
            expires_in: access_token.expires_in,
            refresh_token: access_token.refresh_token,
            scope: access_token.scopes,
            created_at: access_token.inserted_at
          }}
  end
  defp build_response(%{error: error, error_http_status: error_http_status} = _) do
    {:error, error, error_http_status}
  end
  defp build_response(%{error: error}) do # For DB errors
    {:error, error, :bad_request}
  end
end