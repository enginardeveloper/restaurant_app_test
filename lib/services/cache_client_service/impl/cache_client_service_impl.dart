import 'package:rxdart/rxdart.dart';
import '../cache_client_service.dart';

class CacheClientServiceImpl implements CacheClientService {

  CacheClientServiceImpl() : _cache = <String, Object>{};
  final Map<String, Object> _cache;

  final BehaviorSubject _userEntityStream = BehaviorSubject();
  
  @override
  void write<T extends Object>({required String key, required T value}) {
    _cache[key] = value;
  }

  @override
  T? read<T extends Object>({required String key}) {
    final value = _cache[key];
    if (value is T) return value;
    return null;
  }

  @override
  Stream get userEntityCached {
    return _userEntityStream.stream;
  }
}