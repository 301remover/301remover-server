defmodule UnshortenerWeb.Router do
  use UnshortenerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", UnshortenerWeb do
    pipe_through :api
    resources "/shorteners", ShortenerController, except: [:new, :edit]
  end
end
