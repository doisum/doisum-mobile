enum TaskStatus {
  pending,
  doing,
  done,
  rejected,
  skipped,
}

extension TaskStatusExtension on TaskStatus {
  String value() {
    String value;
    switch (this) {
      case TaskStatus.pending:
        value = 'pending';
        break;
      case TaskStatus.doing:
        value = 'doing';
        break;
      case TaskStatus.done:
        value = 'done';
        break;
      case TaskStatus.rejected:
        value = 'rejected';
        break;
      case TaskStatus.skipped:
        value = 'skipped';
        break;
    }
     return value;
  }
}
