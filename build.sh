#!/bin/bash

# Mini TV Live 构建脚本
# 体积优化版本 (< 10MB)

set -e

echo "📱 Mini TV Live 构建脚本"
echo "========================"

# 检查 Flutter
if ! command -v flutter &> /dev/null; then
    echo "❌ Flutter 未安装，请先安装 Flutter SDK"
    exit 1
fi

echo "✅ Flutter 版本: $(flutter --version | head -1)"

# 获取依赖
echo ""
echo "📦 获取依赖..."
flutter pub get

# 清理构建
echo ""
echo "🧹 清理旧构建..."
flutter clean

# 构建 Release APK (按 ABI 分包)
echo ""
echo "🔨 构建 Release APK (体积优化)..."
flutter build apk --release --split-per-abi

# 显示结果
echo ""
echo "✅ 构建完成!"
echo ""
echo "📦 APK 文件位置:"
ls -lh build/app/outputs/flutter-apk/*.apk

echo ""
echo "📊 体积信息:"
du -h build/app/outputs/flutter-apk/*.apk

echo ""
echo "📱 安装到设备:"
echo "  adb install -r build/app/outputs/flutter-apk/app-arm64-v8a-release.apk"
