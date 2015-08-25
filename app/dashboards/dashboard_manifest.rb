class DashboardManifest
  def dashboards
    [
      :builds,
      :bulk_customers,
      :file_reviews,
      :memberships,
      :owners,
      :repos,
      :style_configs,
      :subscriptions,
      :users,
      :violations,
    ]
  end

  def root_dashboard
    dashboards.first
  end
end
