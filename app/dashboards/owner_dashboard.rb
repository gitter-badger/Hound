require "administrate/base_dashboard"

class OwnerDashboard < Administrate::BaseDashboard
  ATTRIBUTES = [
    :id,
    :created_at,
    :updated_at,
    :github_id,
    :name,
    :organization,
    :repos,
    :style_configs,
  ]

  READ_ONLY_ATTRIBUTES = [
    :id,
    :created_at,
    :updated_at,
  ]

  ATTRIBUTE_TYPES = {
    id: Field::String,
    created_at: Field::String,
    updated_at: Field::String,
    github_id: Field::String,
    name: Field::String,
    organization: Field::String,
    repos: Field::HasMany,
    style_configs: Field::HasMany,
  }

  def attribute_types
    ATTRIBUTE_TYPES
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
