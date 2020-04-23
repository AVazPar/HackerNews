//
//  DetailView.swift
//  HackerNews
//
//  Created by Ángeles Vázquez Parra on 23/04/2020.
//  Copyright © 2020 Ángeles Vázquez Parra. All rights reserved.
//

import SwiftUI
import WebKit

struct DetailView: View{
    
    let url: String
    
    var body: some View{
        WebView(urlString: url)
    }
    
}

struct DetailView_Previews: PreviewProvider{
    static var previews: some View{
        DetailView(url: "https://www.google.com")
    }
}

struct WebView: UIViewRepresentable {
    
    let urlString: String?
    
    func makeUIView(context: Context) -> WebView.UIViewType {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeURL = urlString{
            if let url = URL(string: safeURL){
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
    
}
