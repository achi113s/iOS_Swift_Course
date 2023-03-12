//
//  ContentView.swift
//  H4X0RSwiftUI
//
//  Created by Giorgio Latour on 3/11/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.posts, rowContent: { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        if post.points > 300 {
                            Text("🔥 \(post.points)")
                        } else {
                            Text(String(post.points))
                        }
                        Text(post.title)
                    }
                }
            })
            .navigationTitle("H4X0R News")
        }
        .onAppear {
            self.networkManager.fetchData()
        }  // like viewDidLoad
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//let posts = [
//    Post(id: "1", title: "Hello"),
//    Post(id: "2", title: "Bonjour"),
//    Post(id: "3", title: "Hola"),
//    Post(id: "4", title: "Ciao"),
//]
