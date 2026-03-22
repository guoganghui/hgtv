import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import '../models/channel.dart';

class ChannelProvider with ChangeNotifier {
  final Dio _dio = Dio();
  
  List<Channel> _channels = [];
  List<Channel> _favorites = [];
  Channel? _currentChannel;
  bool _isLoading = false;
  String? _error;

  List<Channel> get channels => _channels;
  List<Channel> get favorites => _favorites;
  Channel? get currentChannel => _currentChannel;
  bool get isLoading => _isLoading;
  String? get error => _error;

  // 从 JSON 字符串加载频道
  Future<void> loadChannelsFromJson(String jsonString) async {
    try {
      _isLoading = true;
      notifyListeners();

      final data = json.decode(jsonString);
      if (data is Map && data.containsKey('channels')) {
        _channels = (data['channels'] as List)
            .map((item) => Channel.fromJson(item))
            .toList();
        _error = null;
      } else {
        _error = '无效的频道配置格式';
      }
    } catch (e) {
      _error = '解析失败：${e.toString()}';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // 从 URL 加载频道配置
  Future<void> loadChannelsFromUrl(String url) async {
    try {
      _isLoading = true;
      notifyListeners();

      final response = await _dio.get(url);
      await loadChannelsFromJson(json.encode(response.data));
    } catch (e) {
      _error = '加载失败：${e.toString()}';
      _isLoading = false;
      notifyListeners();
    }
  }

  // 设置当前频道
  void setCurrentChannel(Channel channel) {
    _currentChannel = channel;
    notifyListeners();
  }

  // 切换频道
  void switchChannel(Channel channel) {
    _currentChannel = channel;
    notifyListeners();
  }

  // 收藏/取消收藏
  void toggleFavorite(Channel channel) {
    final index = _favorites.indexWhere((c) => c.id == channel.id);
    if (index >= 0) {
      _favorites.removeAt(index);
    } else {
      _favorites.add(channel);
    }
    notifyListeners();
  }

  bool isFavorite(Channel channel) {
    return _favorites.any((c) => c.id == channel.id);
  }

  // 按分组获取频道
  Map<String, List<Channel>> getChannelsByGroup() {
    final Map<String, List<Channel>> groups = {};
    for (var channel in _channels) {
      final group = channel.group ?? '其他';
      groups.putIfAbsent(group, () => []);
      groups[group]!.add(channel);
    }
    return groups;
  }
}
