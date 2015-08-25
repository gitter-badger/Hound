require "administrate/base_dashboard"

class StyleConfigDashboard < Administrate::BaseDashboard
  ATTRIBUTES = [
    :id,
    :enabled,
    :language,
    :rules,
    :owner_id,
    :owner,
  ]

  READ_ONLY_ATTRIBUTES = [
    :id,
    :created_at,
    :updated_at,
  ]

  ATTRIBUTE_TYPES = {
    id: Field::String,
    enabled: Field::String,
    language: Field::String,
    rules: Field::String,
    owner_id: Field::String,
    owner: Field::BelongsTo,
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
