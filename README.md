# Mini TV Live - 极简电视直播

**辉哥定制版** - 体积极小、界面简洁的 Android 直播应用

![版本](https://img.shields.io/badge/版本 -1.0.0-blue)
![体积](https://img.shields.io/badge/体积 -<10MB-green)
![平台](https://img.shields.io/badge/平台-Android%20TV%2F 手机 / 平板-lightgrey)

---

## ✨ 特性

- 🎯 **极简设计** - 深色主题，无多余元素
- 📦 **体积极小** - 优化后 < 10MB
- 📺 **TV 适配** - 完美支持遥控器操作
- 🚀 **流畅播放** - 46+ 央视 + 卫视频道
- 🎮 **快捷操作** - 方向键切换频道
- 📱 **通用兼容** - TV/手机/平板都能用

---

## 🎨 UI 设计

### 设计理念
- **深色主题** - 保护视力，适合客厅环境
- **大卡片布局** - 频道名称清晰可见
- **分组导航** - 快速定位央视频道/卫视频道
- **无干扰播放** - 播放时隐藏多余 UI

### 配色方案
```
背景色：#0A0A0A (深黑)
卡片色：#1E1E1E (深灰)
强调色：#1E88E5 (蓝色)
文字色：#FFFFFF / #757575
```

---

## 📺 频道列表

### 央视频道 (20 个)
CCTV-1 ~ CCTV-17、CCTV-4K、CCTV-5+、CGTN

### 卫视频道 (26 个)
北京、上海、江苏、浙江、湖南、东方、广东、深圳等

**总计**: 46 个频道 (持续更新)

---

## 🚀 快速开始

### 环境要求

- Flutter SDK >= 3.0.0
- Android SDK >= 21 (Android 5.0+)

### 构建 APK

```bash
cd tv-live-app

# 获取依赖
flutter pub get

# 构建 Release APK (体积优化)
flutter build apk --release --split-per-abi
```

### 安装到 TV

```bash
# ADB 无线安装
adb connect <TV_IP>:5555
adb install build/app/outputs/flutter-apk/app-arm64-v8a-release.apk
```

---

## 🎮 遥控器操作

| 按键 | 功能 |
|------|------|
| ⬆️ 上 | 上一个频道 |
| ⬇️ 下 | 下一个频道 |
| ✅ 确认 | 播放/暂停 |
| ⬅️ 返回 | 返回/退出全屏 |
| 长按频道 | 收藏/取消收藏 |

---

## 📁 项目结构

```
tv-live-app/
├── lib/
│   ├── main.dart              # 应用入口
│   ├── models/
│   │   └── channel.dart       # 频道模型
│   ├── providers/
│   │   └── channel_provider.dart  # 状态管理
│   └── screens/
│       ├── home_screen.dart   # 主界面 (极简设计)
│       └── player_screen.dart # 播放器
├── assets/
│   └── config/
│       └── channels.json      # 频道配置 (46 个频道)
├── android/                   # Android 配置
├── pubspec.yaml              # 依赖配置
├── build.sh                  # 构建脚本
├── SOURCES.md                # 直播源说明
└── README.md                 # 本文件
```

---

## ⚙️ 配置说明

### 频道配置

编辑 `assets/config/channels.json`:

```json
{
  "channels": [
    {
      "id": "cctv1",
      "name": "CCTV-1",
      "url": "https://tv.aixiaolu.tv/live/cctv1.m3u8",
      "group": "央视"
    }
  ]
}
```

### 远程配置

应用内支持输入 URL 动态加载配置，方便批量更新。

---

## 📊 体积优化

| 优化项 | 效果 |
|--------|------|
| ABI 分包 | 减少 40% |
| ProGuard | 减少 20% |
| Tree Shaking | 减少 15% |
| 资源压缩 | 减少 10% |

**最终体积**: ~6MB (arm64-v8a)

---

## ⚠️ 注意事项

1. **直播源**: 使用合法直播源，定期更新
2. **网络**: 需要稳定网络连接
3. **HTTP 支持**: 已配置允许 HTTP 流量
4. **版权**: 仅供个人学习使用

---

## 🛠️ 依赖

```yaml
video_player: ^2.8.0      # 视频播放
chewie: ^1.7.0            # 播放器 UI
dio: ^5.4.0               # HTTP 请求
provider: ^6.1.1          # 状态管理
```

---

## 📝 更新日志

### v1.0.0 (2026-03-21)
- ✅ 初始版本发布
- ✅ 46 个频道配置
- ✅ 极简深色 UI
- ✅ TV 遥控器支持
- ✅ 体积优化 < 10MB

---

## 📄 许可证

MIT License

---

**开发**: 辉哥小助理  
**版本**: 1.0.0  
**更新时间**: 2026-03-21
