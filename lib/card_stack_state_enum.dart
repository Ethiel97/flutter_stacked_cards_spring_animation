enum CardStackState {
  expanded,
  collapsed;

  CardStackState operator +(CardStackState other) => other;

  CardStackState operator -(CardStackState other) => this;

  CardStackState operator *(double value) => this;

  bool get isExpanded => this == CardStackState.expanded;
  bool get isCollapsed => this == CardStackState.collapsed;
}
