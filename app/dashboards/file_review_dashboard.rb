require "administrate/base_dashboard"

class FileReviewDashboard < Administrate::BaseDashboard
  # This method returns a hash
  # that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
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
      :build_id,
      :completed_at,
      :created_at,
      :updated_at,
      :filename,
      :build,
      :violations,
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
