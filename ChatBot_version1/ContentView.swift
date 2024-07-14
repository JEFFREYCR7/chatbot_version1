//
//  ContentView.swift
//  ChatBot_version1
//
//  Created by 王杰瑞
//

import SwiftUI
struct ContentView: View {
    @EnvironmentObject var appModel: DataInterface
    
    var body: some View {
        VStack {
            TextField("Prompt", text: $appModel.prompt)
                .textFieldStyle(.roundedBorder)
                .onSubmit(appModel.sendPrompt)
            
            Divider()
            
            if appModel.isSending {
                ProgressView()
                    .padding()
            } else {
                Text(appModel.response)
            }
            
            HStack {
                Button("发送") {
                    appModel.sendPrompt()
                }
                .keyboardShortcut(.return)
                
                Button("清空") {
                    appModel.prompt = ""
                    appModel.response = ""
                }
                .keyboardShortcut("c")
            }
        }
        .padding()
    }
}
