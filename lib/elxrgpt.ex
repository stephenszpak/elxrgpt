defmodule Elxrgpt do
  @moduledoc """
  Entry point for interacting with the OpenAI client.
  """

  alias Elxrgpt.OpenAIClient

  @doc """
  Sends a single message and returns the assistant's reply.
  """
  def ask(prompt) when is_binary(prompt) do
    messages = [%{"role" => "user", "content" => prompt}]

    with {:ok, %{"choices" => [%{"message" => msg}|_]} } <- OpenAIClient.chat_completion(messages) do
      {:ok, msg["content"]}
    end
  end
end
