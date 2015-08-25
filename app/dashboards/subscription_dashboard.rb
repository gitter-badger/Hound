require "administrate/base_dashboard"

class SubscriptionDashboard < Administrate::BaseDashboard
  ATTRIBUTES = [
    :id,
    :created_at,
    :updated_at,
    :user_id,
    :repo_id,
    :stripe_subscription_id,
    :deleted_at,
    :price,
    :repo,
    :user,
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
      user_id: Field::String,
      repo_id: Field::String,
      stripe_subscription_id: Field::String,
      deleted_at: Field::String,
      price: Field::String,
      repo: Field::BelongsTo,
      user: Field::BelongsTo,
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
