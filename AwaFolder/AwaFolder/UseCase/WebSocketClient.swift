//
//  SocketModel.swift
//  AwaFolder
//
//  Created by tiking on 2022/09/24.
//

import Foundation
import Network
import Combine

struct Message {
    let text: String
    let isRecived: Bool
}

class WebSocketClient: NSObject, ObservableObject {

    private var webSocketTask: URLSessionWebSocketTask?

    @Published var messages: [String] = []
    @Published var isConnected: Bool = false

    func setup() {
        let urlSession = URLSession(configuration: .default, delegate: self, delegateQueue: OperationQueue())
        webSocketTask = urlSession.webSocketTask(with: URL(string: "wss://o2vmciuox2.execute-api.ap-northeast-1.amazonaws.com/production")!)
    }

    func connect() {
        webSocketTask?.resume()
        receive()
    }

    func disconnect() {
        webSocketTask?.cancel(with: .goingAway, reason: nil)
    }

    func send(message: String) {
        setup()
        webSocketTask?.resume()
        webSocketTask?.send(.string(message)) { error in
            if let error = error {
                print(error)
            }
        }
    }
    
    func send(data: Data) {
        webSocketTask?.send(.data(data)) { error in
            if let error = error {
                print("落ちた")
                print(error)
            }
        }
    }

    private func receive() {
        webSocketTask?.receive { [weak self] result in
            switch result {
            case .success(let message):
                switch message {
                case .string(let text):
                    print("Received text message: \(text)")
                    DispatchQueue.main.async {
                        self?.messages.append(text)
                    }
                case .data(let data):
                    print("Received binary message: \(data)")
                @unknown default:
                    fatalError()
                }
                self?.receive()
            case .failure(let error):
                print("Failed to receive message: \(error)")
            }
        }
    }
}

extension WebSocketClient: URLSessionWebSocketDelegate {

    func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didOpenWithProtocol protocol: String?) {
        print("didOpenWithProtocol")
        DispatchQueue.main.async {
            self.isConnected = true
        }
    }

    func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didCloseWith closeCode: URLSessionWebSocketTask.CloseCode, reason: Data?) {
        print("didCloseWith: closeCode: \(closeCode) reason: \(String(describing: reason))")
        DispatchQueue.main.async {
            self.isConnected = false
        }
    }

    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        print("didCompleteWithError error: \(String(describing: error))")
        DispatchQueue.main.async {
            self.isConnected = false
        }
    }
}
