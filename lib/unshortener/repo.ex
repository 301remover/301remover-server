defmodule Unshortener.Repo do
  use Ecto.Repo,
    otp_app: :unshortener,
    adapter: Ecto.Adapters.Postgres
end
