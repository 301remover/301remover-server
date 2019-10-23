defmodule Unshortener.Shorteners do
  @moduledoc """
  The Shorteners context.
  """

  import Ecto.Query, warn: false
  alias Unshortener.Repo

  alias Unshortener.Shorteners.Shortener

  @doc """
  Returns the list of shorteners.

  ## Examples

      iex> list_shorteners()
      [%Shortener{}, ...]

  """
  def list_shorteners do
    Repo.all(Shortener)
  end

  @doc """
  Gets a single shortener.

  Raises `Ecto.NoResultsError` if the Shortener does not exist.

  ## Examples

      iex> get_shortener!(123)
      %Shortener{}

      iex> get_shortener!(456)
      ** (Ecto.NoResultsError)

  """
  def get_shortener!(id), do: Repo.get!(Shortener, id)

  @doc """
  Creates a shortener.

  ## Examples

      iex> create_shortener(%{field: value})
      {:ok, %Shortener{}}

      iex> create_shortener(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_shortener(attrs \\ %{}) do
    %Shortener{}
    |> Shortener.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Creates a shortener.

  ## Examples

      iex> create_shortener(%{field: value})
      {:ok, %Shortener{}}

      iex> create_shortener(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_shortener!(attrs \\ %{}) do
    %Shortener{}
    |> Shortener.changeset(attrs)
    |> Repo.insert!()
  end

  @doc """
  Updates a shortener.

  ## Examples

      iex> update_shortener(shortener, %{field: new_value})
      {:ok, %Shortener{}}

      iex> update_shortener(shortener, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_shortener(%Shortener{} = shortener, attrs) do
    shortener
    |> Shortener.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Shortener.

  ## Examples

      iex> delete_shortener(shortener)
      {:ok, %Shortener{}}

      iex> delete_shortener(shortener)
      {:error, %Ecto.Changeset{}}

  """
  def delete_shortener(%Shortener{} = shortener) do
    Repo.delete(shortener)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking shortener changes.

  ## Examples

      iex> change_shortener(shortener)
      %Ecto.Changeset{source: %Shortener{}}

  """
  def change_shortener(%Shortener{} = shortener) do
    Shortener.changeset(shortener, %{})
  end
end
