defmodule Issues.GithubIssues do
  require Logger

  @github_url Application.fetch_env!(:issues, :github_url)
  @user_agent [{"User-agent", "Elixir spat.monroe@gmail.com"}]

  def fetch(user, project) do
    Logger.info(fn -> "Fetching #{user}'s project #{project}" end)

    issues_url(user, project)
    |> HTTPoison.get(@user_agent)
    |> handle_response
  end

  def issues_url(user, project) do
    "#{@github_url}/repos/#{user}/#{project}/issues"
  end

  def handle_response({_, %{status_code: status_code, body: body}}) do
    Logger.info("Got response: status code =#{status_code}")
    Logger.debug(fn -> inspect(body) end)

    {
      status_code |> check_for_error(),
      body |> Jason.decode!()
    }
  end

  defp check_for_error(200), do: :ok
  defp check_for_error(_), do: :error
end
