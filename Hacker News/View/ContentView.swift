//
//  ContentView.swift
//  Hacker News
//
//  Created by Hsueh Chih Liu on 2019/12/12.
//  Copyright © 2019 Luke Liu. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    //@observedObject will keep listen to the object
    //when networkManager updated, it will be triggered
    @ObservedObject var networkManager = NetworkManager()
    var body: some View {
        //for back
        NavigationView{
            List(networkManager.posts, rowContent: { (post) in
                //use all the post in the posts to populate the data
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                        
                    }
                }
                
                
            })
                .navigationBarTitle("Hacker News")
            //can not change navigation color for now, wait for apple to update
        }
            //onAppear == viewDidLoad
            .onAppear {
                self.networkManager.fetchData()
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//identifiable can order by the specific variable (id)
//struct Post:Identifiable {
//    let id: String
//    let title:String
//    
//}
//
//
//let posts = [Post(points: 1, title: "se", url: "se", objectID: "1234"),Post(points: 1, title: "se", url: "se", objectID: "12345")
//    Post(id: "1", title: "hello1"),Post(id: "2", title: "hello2"),Post(id: "3", title: "hello3")

//]
