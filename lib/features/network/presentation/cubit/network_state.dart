
import '../../domain/entities/enum.dart';

class NetworkState {
  final ConnectionStatus status;
  final String? lastOnlineRoute;

  NetworkState({
    required this.status,
    this.lastOnlineRoute,
  });

  factory NetworkState.initial() =>
      NetworkState(status: ConnectionStatus.online);

  NetworkState copyWith({
    ConnectionStatus? status,
    String? lastOnlineRoute,
  }) {
    return NetworkState(
      status: status ?? this.status,
      lastOnlineRoute: lastOnlineRoute ?? this.lastOnlineRoute,
    );
  }
}
