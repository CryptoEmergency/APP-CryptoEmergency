//
//  ContentView.swift
//  cryptoEmergency
//
//  Created by Кизим Илья on 22.04.2024.
//

import SwiftUI
import WebKit

struct ContentView: View {
    @State private var isShowingSplash = true

    var body: some View {
        ZStack {
            WebViewWrapper(urlString: "https://crypto-emergency.com")
                .edgesIgnoringSafeArea([.bottom])
                .background(Color(red: 32/255, green: 30/255, blue: 41/255))

            if isShowingSplash {
                SplashScreen()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            withAnimation {
                                isShowingSplash = false
                            }
                        }
                    }
            }
        }
    }
}

struct SplashScreen: View {
    var body: some View {
        Color(red: 32/255, green: 30/255, blue: 41/255)
            .ignoresSafeArea(.all)
        Text("SPLASH SCREEN")
            .foregroundStyle(.white)
    }
}

struct WebViewWrapper: UIViewRepresentable {
    let urlString: String

    func makeUIView(context: Context) -> WKWebView {
        guard let url = URL(string: urlString) else {
            return WKWebView()
        }
        let webView = WKWebView()
        webView.load(URLRequest(url: url))
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let url = URL(string: urlString) else {
            return
        }
        uiView.load(URLRequest(url: url))
    }
}

#Preview {
    ContentView()
}
