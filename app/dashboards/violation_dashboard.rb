require "administrate/base_dashboard"

class ViolationDashboard < Administrate::BaseDashboard
  ATTRIBUTES = [
    :id,
    :created_at,
    :updated_at,
    :patch_position,
    :line_number,
    :messages,
    :pending,
    :file_review_id,
    :file_review,
  ]

  READ_ONLY_ATTRIBUTES = [
    :id,
    :created_at,
    :updated_at,
  ]

  def attribute_types
    {
      id: Field::String,
      created_at: Field::String,
      updated_at: Field::String,
      patch_position: Field::String,
      line_number: Field::String,
      messages: Field::String,
      pending: Field::String,
      file_review_id: Field::String,
      file_review: Field::BelongsTo,
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
