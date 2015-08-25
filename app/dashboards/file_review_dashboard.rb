require "administrate/base_dashboard"

class FileReviewDashboard < Administrate::BaseDashboard
  ATTRIBUTES = [
    :id,
    :build_id,
    :completed_at,
    :created_at,
    :updated_at,
    :filename,
    :build,
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
      build_id: Field::String,
      completed_at: Field::String,
      created_at: Field::String,
      updated_at: Field::String,
      filename: Field::String,
      build: Field::BelongsTo,
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
