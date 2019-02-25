defmodule Unshortener.Unshorten do
  def unshorten(shortlinks \\ []) do
    shortlinks
    |> Enum.map(&handle_link/1)
    |> Enum.map(fn task ->
      case Task.await(task) do
        {:ok, i} -> i
        {:error, _} -> nil
      end
    end)
  end

  defp handle_link(%{"domain" => domain, "shortcode" => shortcode}) do
    Task.async(Unshortener.RpcClient, :request, [Unshortener.RpcClient, domain, shortcode])
  end
end
