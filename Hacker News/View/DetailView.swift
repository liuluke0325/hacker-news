//
//  DetailView.swift
//  Hacker News
//
//  Created by Hsueh Chih Liu on 2019/12/16.
//  Copyright © 2019 Luke Liu. All rights reserved.
//

import SwiftUI


struct DetailView: View {
    let url:String? // because can be nil
    var body: some View {
        WebView(urlString: url )
        //Text(url ?? "no url").padding()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.google.com")
    }
}
