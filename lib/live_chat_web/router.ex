defmodule LiveChatWeb.Router do
  use LiveChatWeb, :router
  import Phoenix.LiveView.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", LiveChatWeb do
    pipe_through :browser

    get "/", PageController, :index
    live "/conversations/:conversation_id/users/:user_id", ConversationLive

  end

  # Other scopes may use custom stacks.
  # scope "/api", LiveChatWeb do
  #   pipe_through :api
  # end
end
