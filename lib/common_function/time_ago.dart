class TimeAgo{
  static String timeAgo(String timestamp) {
    // Parse the timestamp into a DateTime object
    DateTime parsedTime = DateTime.parse(timestamp);

    // Get the current time
    DateTime now = DateTime.now().toUtc(); // Assuming the timestamp is in UTC

    // Calculate the difference between now and the parsed time
    Duration difference = now.difference(parsedTime);

    if (difference.inMinutes < 60) {
      // If the difference is less than 60 minutes, return minutes ago
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inHours < 24) {
      // If the difference is less than 24 hours, return hours:minutes ago
      int hours = difference.inHours;
      int minutes = difference.inMinutes % 60; // Remaining minutes
      return '${hours}h:${minutes}m ago';
    } else {
      // If the difference is 24 hours or more, return days:hours ago
      int days = difference.inDays;
      int hours = difference.inHours % 24; // Remaining hours
      return '${days}d:${hours}h ago';
    }
  }
}