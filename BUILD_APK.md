# 📦 获取 APK 安装包

由于当前环境无法直接构建 APK，请选择以下方案：

---

## 方案 1: 本地构建（最快）

### 前提条件
- 已安装 [Flutter SDK](https://docs.flutter.dev/get-started/install)
- 已安装 Android SDK / Android Studio

### 步骤

```bash
# 1. 复制项目到电脑
# 从服务器下载 tv-live-app 文件夹

# 2. 打开终端，进入项目目录
cd tv-live-app

# 3. 获取依赖
flutter pub get

# 4. 构建 APK
flutter build apk --release --split-per-abi

# 5. 等待完成（约 2-5 分钟）
# APK 输出位置:
# - build/app/outputs/flutter-apk/app-arm64-v8a-release.apk (64 位，推荐)
# - build/app/outputs/flutter-apk/app-armeabi-v7a-release.apk (32 位，老设备)
```

### 安装到 TV

```bash
# 方法 1: ADB 无线安装
adb connect <TV_IP>:5555
adb install build/app/outputs/flutter-apk/app-arm64-v8a-release.apk

# 方法 2: U 盘安装
# 将 APK 拷贝到 U 盘，插入 TV 后使用文件管理器安装
```

---

## 方案 2: GitHub Actions 自动构建

### 步骤

1. **创建 GitHub 仓库**
   ```bash
   cd tv-live-app
   git init
   git add .
   git commit -m "Initial commit"
   ```

2. **推送到 GitHub**
   ```bash
   git remote add origin https://github.com/你的用户名/mini-tv-live.git
   git branch -M main
   git push -u origin main
   ```

3. **等待构建完成**
   - 访问 GitHub 仓库 → Actions 标签
   - 等待构建完成（约 10-15 分钟）
   - 下载 APK 文件（保留 30 天）

---

## 方案 3: 使用在线 Flutter 构建服务

### Codemagic (免费)

1. 访问 https://codemagic.io
2. 连接 GitHub 仓库
3. 自动构建并输出 APK

---

## 方案 4: 找人代构建

如果你没有 Flutter 环境，可以：

1. 将整个 `tv-live-app` 文件夹打包下载
2. 找有 Flutter 环境的朋友帮忙构建
3. 或在 Android 开发者社区求助

---

## 📊 预期结果

| APK 类型 | 大小 | 适用设备 |
|---------|------|---------|
| arm64-v8a | ~6MB | 大多数现代 TV/手机 |
| armeabi-v7a | ~5MB | 老设备 (Android 5-7) |

---

## ⚠️ 注意事项

1. **首次构建较慢** - 需要下载 Gradle 和依赖（约 10-20 分钟）
2. **后续构建快** - 缓存后约 1-2 分钟
3. **确保网络畅通** - 需要访问 Google Maven 仓库

---

**需要帮助？** 告诉我你选择的方案，我可以提供详细指导！
