# chatbot_version1 for mac os

使用Swift 代码实现了一个用于处理数据和网络通信的类

主要功能是发送一个网络请求，将用户的输入 (prompt) 发送到服务器并接收响应，然后将响应结果显示出来。使用 SwiftUI 的 @Published 属性包装器来触发 UI 更新，使用户可以实时看到响应结果。

定义了一个 SwiftUI 的视图 ContentView，用于展示和操作数据

这个 SwiftUI 视图提供了一个用户界面，允许用户输入提示并发送到服务器，然后显示响应结果。使用 @EnvironmentObject 属性包装器共享数据，并通过绑定和按钮交互实现功能。

### 使用LLaMA3
下载Ollama (https://ollama.com/)

进入官网，点击download。安装好后，使用终端输入`Ollama run llama3`

<img width="686" alt="截屏2024-07-15 01 31 36" src="https://github.com/user-attachments/assets/a47fce90-c207-4cb9-9607-ce684f3c4c3b">

/* 输入 ([http://127.0.0.1:11434/](http://127.0.0.1:11434/) 也可以查看Ollama是否在运行

<img width="655" alt="截屏2024-07-15 01 33 07" src="https://github.com/user-attachments/assets/acba7887-23a2-48ca-a025-0ebf7fe0e134">

运行程序

<img width="368" alt="截屏2024-07-15 01 01 57" src="https://github.com/user-attachments/assets/399e7768-a324-40a1-a127-1a21e881a15c">

<img width="368" alt="截屏2024-07-15 01 02 23" src="https://github.com/user-attachments/assets/dd93ed79-758f-486c-9f1f-c3fdee8b88fe">

<img width="368" alt="截屏2024-07-15 01 03 37" src="https://github.com/user-attachments/assets/43036dff-7f93-4285-a1cb-3871089b6e6c">





