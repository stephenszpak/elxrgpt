# Elxrgpt Explanation

This document provides an overview of the example Elixir project used in this repository. The project demonstrates how to call OpenAI's ChatGPT API from an Elixir application.

## mix.exs
Contains the project definition, dependencies and application information. It includes the `httpoison` and `jason` libraries for making HTTP requests and handling JSON data. These dependencies are required to send chat completion requests to OpenAI and decode the responses.

## lib/elxrgpt/openai_client.ex
Defines a small client module for the ChatGPT API. The `chat_completion/2` function builds the request body, adds the required authorization header using the `OPENAI_API_KEY` environment variable, and sends a POST request to the API endpoint. It returns the parsed JSON response or an error tuple.

## lib/elxrgpt.ex
Provides a simple public interface with an `ask/1` function. This helper accepts a user prompt, wraps it in the format expected by the API and delegates the call to `Elxrgpt.OpenAIClient`. On success it extracts the assistant's reply from the API response.

## README.md
Describes basic setup steps: installing dependencies, setting the API key, and running the helper function in an `iex` session.

