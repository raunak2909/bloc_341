class CounterEvent{}

/// all events
class IncrementCountEvent extends CounterEvent{
  int count;
  IncrementCountEvent({required this.count});
}
class DecrementCountEvent extends CounterEvent{}