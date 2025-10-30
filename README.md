
# 无赖 Flutter SDK（wulai_flutter）


简体中文 | [English](README_EN.md)

## 📖 项目描述

`wulai_flutter` 是一个专为 Flutter 应用程序设计的强大且灵活的到期日管理插件。它旨在帮助开发者轻松地集成到期日提醒功能，例如会员到期、试用期结束或任何基于时间的服务。通过智能计算剩余天数、动态调整 UI 元素的透明度以及提供可定制的到期回调机制，`wulai_flutter` 确保你的应用能够优雅地处理时间敏感的业务逻辑，并提供直观的用户体验。

## ✨ 功能特性

- 📅 **智能到期计算**: 自动、精确地计算距离指定到期日的剩余天数。
- 🎨 **动态透明度**: 根据到期时间（例如，剩余天数越少，透明度越低）动态调整界面元素的透明度，提供视觉上的提醒。
- 🔔 **到期回调**: 提供灵活的 `onExpiryDateDue` 回调方法，允许你在到期日到达时执行自定义逻辑，如显示弹窗、发送通知等。
- 🎯 **UI 组件**: 内置 `Wulai` 和 `WulaiWarning` 等预构建的 Flutter Widget，开箱即用，帮助你快速集成到期提醒界面。
- 📱 **跨平台**: 完全兼容 iOS 和 Android 平台，确保一致的用户体验。

## 🎯 运行要求

为了确保 `wulai_flutter` 插件的正常运行，你的开发环境需要满足以下最低要求：

| 环境        | 最低版本 |
|-------------|----------|
| Flutter     | 3.10.0   |
| Dart        | 3.0.0    |
| Android     | 21（5.0）|
| iOS         | 11.0     |

## 🚀 快速安装

### 1. 添加依赖

在你的 Flutter 项目的 `pubspec.yaml` 文件中，`dependencies` 部分添加 `wulai_flutter`：

```yaml
dependencies:
  flutter:
    sdk: flutter
  wulai_flutter: 0.0.1
```

然后运行 `flutter pub get` 命令来获取新的依赖。

### 2. 导入包

在你需要使用 `wulai_flutter` 功能的 Dart 文件中导入：

```dart
import 'package:wulai_flutter/wulai_flutter.dart';
```

## 💡 使用示例

`wulai_flutter` 提供了简单直观的 API 来管理和显示到期日信息。

### 基本用法

你可以使用 `Wulai` Widget 来包裹你的内容，并传入 `dueDate` 和 `onExpiryDateDue` 回调。当 `dueDate` 到期时，`onExpiryDateDue` 会被触发。

```dart
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final dueDate = DateTime(2025, 10, 30);
  final today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Wulai(
        dueDate: dueDate,
        deadlineDays: dueDate.difference(today).inDays,
        child: const MyHomePage(title: 'Flutter Demo Home Page'),
        whenExpiryDoThis: () { 
            // 如果希望使用包的默认页面，则无需声明；否则，请在此处声明你想要执行的逻辑。
            // If you want to use the default page of the package, you do not need to declare; otherwise, please declare what you want to do.

            return null;
        },
      ),
    );
  }
}
```

![img](./assets/demo.jpg)

### `WulaiWarning` 组件

`WulaiWarning` 是一个预设的警告组件，用于在到期日临近或到达时显示警告信息。

```dart
WulaiWarning(
  message: '您的试用期即将结束！',
  backgroundColor: Colors.orange,
  textColor: Colors.black,
  icon: Icons.warning,
);
```

## ⚙️ 配置选项与环境变量

`wulai_flutter` 插件本身不依赖于特定的环境变量。所有的配置都通过 `Wulai` Widget 的属性进行。

### `Wulai` Widget 属性

| 属性名           | 类型                     | 描述                                         | 默认值 |
|------------------|--------------------------|----------------------------------------------|--------|
| `dueDate`        | `DateTime`               | 必填。指定到期日期。                         | 无     |
| `onExpiryDateDue`| `VoidCallback?`          | 可选。到期日到达时触发的回调函数。           | `null` |
| `builder`        | `WulaiBuilder`           | 必填。用于构建子 Widget 的函数，提供剩余天数和透明度。 | 无     |
| `core`           | `WulaiCore?`             | 可选。自定义 `WulaiCore` 实例，用于高级控制。 | 内部默认实例 |

### `WulaiWarning` Widget 属性

| 属性名           | 类型                     | 描述                                         | 默认值 |
|------------------|--------------------------|----------------------------------------------|--------|
| `message`        | `String`                 | 必填。警告信息文本。                         | 无     |
| `backgroundColor`| `Color?`                 | 可选。警告背景颜色。                         | `Colors.yellow` |
| `textColor`      | `Color?`                 | 可选。警告文本颜色。                         | `Colors.black` |
| `icon`           | `IconData?`              | 可选。警告图标。                             | `Icons.info_outline` |
| `padding`        | `EdgeInsetsGeometry?`    | 可选。警告内容的内边距。                     | `EdgeInsets.all(8.0)` |
| `margin`         | ``EdgeInsetsGeometry?`   | 可选。警告组件的外边距。                     | `EdgeInsets.symmetric(vertical: 8.0)` |
| `borderRadius`   | `BorderRadiusGeometry?`  | 可选。警告框的圆角。                         | `BorderRadius.circular(4.0)` |

## 🤝 贡献指南

我们非常欢迎社区的贡献！如果你有兴趣改进 `wulai_flutter`，请遵循以下步骤：

1.  **Fork** 本仓库到你的 GitHub 账户。
2.  **克隆** 你 Fork 的仓库到本地。
    ```bash
    git clone https://github.com/ctkqiang/wulai_flutter.git
    ```
3.  **创建新分支** 进行你的功能开发或 Bug 修复。
    ```bash
    git checkout -b feature/your-feature-name
    ```
4.  **编写代码** 并确保遵循项目编码规范。
5.  **编写测试** 并确保所有测试通过。
6.  **提交你的更改**。
    ```bash
    git commit -m "feat: 添加新功能"
    ```
7.  **推送到你的远程仓库**。
    ```bash
    git push origin feature/your-feature-name
    ```
8.  **创建 Pull Request** 到 `wulai_flutter` 的 `main` 分支。请详细描述你的更改内容和目的。

### 开发工作流程

-   **Bug 报告**: 如果你发现任何 Bug，请在 GitHub Issues 中提交，并提供详细的复现步骤。
-   **功能请求**: 如果你有新的功能想法，也欢迎在 GitHub Issues 中提出。
-   **代码审查**: 所有的 Pull Request 都需要经过代码审查才能合并。

## 📄 许可信息

`wulai_flutter` 遵循 MIT 许可证。详情请参阅仓库中的 `LICENSE` 文件。

## 🚧 项目状态

`wulai_flutter` 目前处于积极开发和维护阶段。我们致力于提供稳定、高效的到期日管理解决方案。欢迎提出建议和反馈！

## ❓ 故障排除

### 1. 插件未按预期工作

-   **检查 `pubspec.yaml`**: 确保 `wulai_flutter` 依赖已正确添加，并且已运行 `flutter pub get`。
-   **检查 `dueDate`**: 确保你传入的 `dueDate` 是一个有效的 `DateTime` 对象，并且逻辑上符合你的预期。
-   **检查 `builder`**: 确保 `builder` 函数正确地使用了 `remainingDays` 和 `opacity` 参数来构建你的 UI。
-   **查看控制台输出**: 检查是否有任何错误或警告信息。

### 2. `onExpiryDateDue` 未触发

-   **检查 `dueDate`**: 确保 `dueDate` 确实已经到达或已经过去。
-   **检查回调逻辑**: 确保 `onExpiryDateDue` 中的逻辑是正确的，并且没有被其他代码阻塞。

### 3. UI 透明度不正确

-   **检查 `opacity` 参数**: 确保你在 `builder` 函数中正确地将 `opacity` 参数应用到了你的 Widget 上。
-   **检查 `dueDate`**: 透明度是根据 `dueDate` 和当前时间计算的，请确保 `dueDate` 设置正确。

如果以上方法都无法解决你的问题，请在 GitHub Issues 中提交你的问题，并提供详细的复现步骤和相关代码。

---


### 🌐 全球捐赠通道

#### 国内用户

<div align="center" style="margin: 40px 0">

<div align="center">
<table>
<tr>
<td align="center" width="300">
<img src="https://github.com/ctkqiang/ctkqiang/blob/main/assets/IMG_9863.jpg?raw=true" width="200" />
<br />
<strong>🔵 支付宝</strong>（小企鹅在收金币哟~）
</td>
<td align="center" width="300">
<img src="https://github.com/ctkqiang/ctkqiang/blob/main/assets/IMG_9859.JPG?raw=true" width="200" />
<br />
<strong>🟢 微信支付</strong>（小绿龙在收金币哟~）
</td>
</tr>
</table>
</div>
</div>

#### 国际用户

<div align="center" style="margin: 40px 0">
  <a href="https://qr.alipay.com/fkx19369scgxdrkv8mxso92" target="_blank">
    <img src="https://img.shields.io/badge/Alipay-全球支付-00A1E9?style=flat-square&logo=alipay&logoColor=white&labelColor=008CD7">
  </a>
  
  <a href="https://ko-fi.com/F1F5VCZJU" target="_blank">
    <img src="https://img.shields.io/badge/Ko--fi-买杯咖啡-FF5E5B?style=flat-square&logo=ko-fi&logoColor=white">
  </a>
  
  <a href="https://www.paypal.com/paypalme/ctkqiang" target="_blank">
    <img src="https://img.shields.io/badge/PayPal-安全支付-00457C?style=flat-square&logo=paypal&logoColor=white">
  </a>
  
  <a href="https://donate.stripe.com/00gg2nefu6TK1LqeUY" target="_blank">
    <img src="https://img.shields.io/badge/Stripe-企业级支付-626CD9?style=flat-square&logo=stripe&logoColor=white">
  </a>
</div>

---

### 📌 开发者社交图谱

#### 技术交流

<div align="center" style="margin: 20px 0">
  <a href="https://github.com/ctkqiang" target="_blank">
    <img src="https://img.shields.io/badge/GitHub-开源仓库-181717?style=for-the-badge&logo=github">
  </a>
  
  <a href="https://stackoverflow.com/users/10758321/%e9%92%9f%e6%99%ba%e5%bc%ba" target="_blank">
    <img src="https://img.shields.io/badge/Stack_Overflow-技术问答-F58025?style=for-the-badge&logo=stackoverflow">
  </a>
  
  <a href="https://www.linkedin.com/in/ctkqiang/" target="_blank">
    <img src="https://img.shields.io/badge/LinkedIn-职业网络-0A66C2?style=for-the-badge&logo=linkedin">
  </a>
</div>

#### 社交互动

<div align="center" style="margin: 20px 0">
  <a href="https://www.instagram.com/ctkqiang" target="_blank">
    <img src="https://img.shields.io/badge/Instagram-生活瞬间-E4405F?style=for-the-badge&logo=instagram">
  </a>
  
  <a href="https://twitch.tv/ctkqiang" target="_blank">
    <img src="https://img.shields.io/badge/Twitch-技术直播-9146FF?style=for-the-badge&logo=twitch">
  </a>
  
  <a href="https://github.com/ctkqiang/ctkqiang/blob/main/assets/IMG_9245.JPG?raw=true" target="_blank">
    <img src="https://img.shields.io/badge/微信公众号-钟智强-07C160?style=for-the-badge&logo=wechat">
  </a>
</div>

---

🙌 感谢您成为开源社区的重要一员！  
💬 捐赠后欢迎通过社交平台与我联系，您的名字将出现在项目致谢列表！