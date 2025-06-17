defmodule Elxrgpt.OpenAIClient do
  @moduledoc """
  Simple client for OpenAI's Chat Completion API.
  """

  @endpoint "https://api.openai.com/v1/chat/completions"

  def chat_completion(messages, opts \\ []) when is_list(messages) do
    body = %{
      "model" => Keyword.get(opts, :model, "gpt-3.5-turbo"),
      "messages" => messages
    }

    headers = [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{api_key()}"}
    ]

    with {:ok, response} <- HTTPoison.post(@endpoint, Jason.encode!(body), headers, recv_timeout: 30_000),
         {:ok, decoded} <- Jason.decode(response.body) do
      {:ok, decoded}
    else
      error -> error
    end
  end

  defp api_key do
    System.get_env("OPENAI_API_KEY") || raise "OPENAI_API_KEY env var not set"
  end
end
