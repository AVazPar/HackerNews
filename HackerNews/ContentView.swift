//
//  ContentView.swift
//  HackerNews
//
//  Created by Ángeles Vázquez Parra on 23/04/2020.
//  Copyright © 2020 Ángeles Vázquez Parra. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView{
            
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack{
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
            }
            
        }
        .navigationBarTitle("Hacker News!").foregroundColor(.green)
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
