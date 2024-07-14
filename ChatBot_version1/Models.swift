//
//  Models.swift
//  ChatBot_version1
//
//  Created by 王杰瑞
//

import Foundation

struct Response: Codable {
    let model: String
    let response: String
}

class DataInterface: ObservableObject, Observable {
    // 将当前提示存储为可修改的字符串
    @Published var prompt: String = ""
    // 将对提示的响应存储为可修改的字符串
    @Published var response: String = ""
    // 跟踪当前是否正在发送网络请求
    @Published var isSending:Bool = false
    
    // 传输prompt的函数sendPrompt()
    func sendPrompt(){
        print("开始发送prompt")
        guard !prompt.isEmpty, !isSending else {
            return
        }
        isSending = true
        
        // 定义服务器的端点 server endpoint
        let urlString = "http://127.0.0.1:11434/api/generate"
        // 安全地解开从 urlString 构造的 URL
        guard let url = URL(string: urlString) else {return}
        
        //  使用 URL 准备网络请求
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let body:[String: Any] = [
            "model": "llama3",
            "prompt": prompt,
            "options": [
                "num_ctx": 4096
            ]
        ]
        
        // 将请求正文编码为 JSON
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        
        // 使用请求启动数​​据任务
        URLSession.shared.dataTask(with: request) {
            data, response, error in
            defer {DispatchQueue .main.async {self.isSending = false } }
            if let error = error{
                DispatchQueue.main.async {
                    // 通过更新响应处理错误
                    self.response = "Error: \(error.localizedDescription)" }
                return
            }
            
            // 确保收到数据
            guard let data = data else{
                // 处理数据缺失的情况
                DispatchQueue.main.async {self.response = "No data received"}
                return
            }
            
            // 初始化 JSON 解码器
            let decoder = JSONDecoder()
            // 将数据拆分成行
            let lines = data.split(separator: 10)
            // 用于保存解码后的响应的数组
            var responses = [String]()
            
            for line in lines {
                if let jsonLine = try? decoder.decode(Response .self, from: Data(line)){
                    // 解码每一行并附加响应
                    responses.append(jsonLine.response)
                }
            }
            
            // 记录所有响应
            print(responses)
            
            DispatchQueue .main.async {
                self.response = responses.joined(separator: "")
                print(self.response)
            }
        }
        // 如果任务已暂停，则恢复该任务
        .resume()
    }
}

