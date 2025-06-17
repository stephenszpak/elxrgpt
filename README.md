# Elxrgpt

Example Elixir project showing how to call the OpenAI ChatGPT API.

## Setup

1. Install Elixir and Mix.
2. Fetch dependencies:

```bash
mix deps.get
```

3. Set your OpenAI API key:

```bash
export OPENAI_API_KEY=your_key_here
```

## Usage

Start an `iex` session and call the helper:

```elixir
iex -S mix
Elxrgpt.ask("Hello!")
```

The module will return the assistant's reply.
