defmodule AppStore.API.SubscriptionStatus do
  @moduledoc """
  The module for Subscription Status
  """

  alias AppStore.API.{Config, Error, Response, HTTP}

  @type original_transaction_id :: String.t()

  @path_prefix "/inApps/v1/transactions"

  @doc """
  Get the statuses for all of a customer’s subscriptions in your app.

  Official documentation: https://developer.apple.com/documentation/appstoreserverapi/get_all_subscription_statuses
  """
  @spec get_transaction_info(Config.t(), String.t(), original_transaction_id) ::
          {:error, Error.t()} | {:ok, Response.t()}
  def get_transaction_info(%Config{} = api_config, token, original_transaction_id) do
    path = "#{@path_prefix}/#{original_transaction_id}"

    HTTP.get(api_config, token, path)
  end
end
