//
//  WebView.swift
//  Hacker News
//
//  Created by Hsueh Chih Liu on 2019/12/16.
//  Copyright © 2019 Luke Liu. All rights reserved.
//

import Foundation

import SwiftUI
import WebKit


struct WebView : UIViewRepresentable {
   
   
    let urlString:String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = urlString{
            
            //change the urlString to URL
            if let url = URL(string: safeString){
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
    
}
