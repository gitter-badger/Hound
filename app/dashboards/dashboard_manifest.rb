class DashboardManifest
  DASHBOARDS = [
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

  def dashboards
    DASHBOARDS
  end

  def root_dashboard
    dashboards.first
  end
end
