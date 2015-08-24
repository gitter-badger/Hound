require "administrate/base_dashboard"

class SubscriptionDashboard < Administrate::BaseDashboard

  # This method returns a hash
  # that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
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

  # This method returns an array of attributes
  # that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to remove the limit or customize the returned array.
  def table_attributes
    attributes.first(4)
  end

  # This method returns an array of attributes
  # that will be displayed on the model's show page
  def show_page_attributes
    attributes
  end

  # This method returns an array of attributes
  # that will be displayed on the model's form pages (`new` and `edit`)
  def form_attributes
    attributes - read_only_attributes
  end

  private

  def attributes
    [
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
  end

  def read_only_attributes
    [
      :id,
      :created_at,
      :updated_at,
    ]
  end
end
