require "administrate/base_dashboard"

class BuildDashboard < Administrate::BaseDashboard
  ATTRIBUTES = [
    :id,
    :violations_archive,
    :repo_id,
    :created_at,
    :updated_at,
    :uuid,
    :pull_request_number,
    :commit_sha,
    :repo,
    :user,
    :file_reviews,
    :violations,
  ]

  READ_ONLY_ATTRIBUTES = [
    :id,
    :created_at,
    :updated_at,
  ]

  def attribute_types
    {
      id: Field::String,
      violations_archive: Field::String,
      repo_id: Field::String,
      created_at: Field::String,
      updated_at: Field::String,
      uuid: Field::String,
      pull_request_number: Field::String,
      commit_sha: Field::String,
      repo: Field::BelongsTo,
      user: Field::BelongsTo,
      file_reviews: Field::HasMany,
      violations: Field::HasMany,
    }
  end

  def table_attributes
    ATTRIBUTES.first(4)
  end

  def show_page_attributes
    ATTRIBUTES
  end

  def form_attributes
    ATTRIBUTES - READ_ONLY_ATTRIBUTES
  end
end
