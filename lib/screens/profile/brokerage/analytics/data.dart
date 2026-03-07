part of 'analytics.dart';

Map<String, dynamic> Function(String) get getAnalyticsById {
  return (String analyticsId) {
    final allAnalytics = [
      {
        "id": "analytics_1",
        "title": "Monthly Referrals",
        "value": 124,
        "period": "2024-02",
      },
      {
        "id": "analytics_2",
        "title": "Conversion Rate",
        "value": 18.5,
        "period": "2024-02",
      },
      {
        "id": "analytics_3",
        "title": "Active Agents",
        "value": 42,
        "period": "2024-02",
      },
    ];

    final analytics = allAnalytics.firstWhere(
      (a) => a['id'] == analyticsId,
      orElse: () => {
        "id": analyticsId,
        "title": "Unknown Metric",
        "value": 0,
        "period": "N/A",
      },
    );

    return analytics;
  };
}
