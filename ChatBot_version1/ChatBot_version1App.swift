//
//  ChatBot_version1App.swift
//  ChatBot_version1
//
//  Created by 王杰瑞 on 2024/7/15.
//

import SwiftUI

@main
struct ChatBot_version1App: App {
    var body: some Scene {
        // 为应用程序创建数据接口实例
        @StateObject var appModel = DataInterface()
        MenuBarExtra("LLaMA Chat Bar", systemImage: "cloud"){
//            单击菜单栏时将显示内容视图
            ContentView()
                .environment(appModel)
        }
//        此修饰符让我们在菜单栏中显示窗口
        .menuBarExtraStyle(.window)
        
    }
}
