defmodule PassiveTotal.Project do
  import PassiveTotal.Utils

  @doc """
  Add project tags
  """
  def add_tags(client, project_uuid, tags) when is_list(tags) and is_binary(project_uuid) do
    Tesla.post(client, "/project/tag", %{project: project_uuid, tags: tags})
    |> parse_response()
  end

  def remove_tags(client, project_uuid, tags) when is_list(tags) and is_binary(project_uuid) do
    Tesla.delete(client, "/project/tag", %{project: project_uuid, tags: tags})
    |> parse_response()
  end

  def set_tags(client, project_uuid, tags) when is_list(tags) and is_binary(project_uuid) do
    Tesla.put(client, "/project/tag", %{project: project_uuid, tags: tags})
    |> parse_response()
  end

  def create(client, name, visibility, description \\ "", featured \\ false, tags \\ [])
    when visibility in ["public", "private", "analyst"] do
      Tesla.put(client, "/project", %{name: name, visibility: visibility, description: description, featured: featured, tags: tags})
      |> parse_response()
  end

  def delete(client, project_uuid) do
    Tesla.delete(client, "/project", %{project: project_uuid})
    |> parse_response()
  end

  @doc """
  Retrieves a project or projects by search filter

  valid `search_params`:
  - `:project`: UUID ofthe project
  - `:owner`: Email ororganization id
  - `:creator`: Creator email
  - `:organiszation`
  - `:visibility`: `"public"`, `"private"` or `"analyst"`
  - `:featured`: boolean
  """
  def find(client, %{} = search_params) do
    Tesla.get(client, "/project", query: search_params)
    |> parse_response()
  end

  @doc """
  Updates a project denoted by project ID

  valid `update_params`:
  - `:name`: a new name
  - `:description`: a new description
  - `:visibility`: `"public"`, `"private"` or `"analyst"`
  - `:featured`: boolean  
  - `:tags`: list
  """
  def update(client, project_uuid, %{} = update_params) do
    params = Map.put(update_params, :project, project_uuid)
    Tesla.post(client, "/project", params)
    |> parse_response()
  end
end
