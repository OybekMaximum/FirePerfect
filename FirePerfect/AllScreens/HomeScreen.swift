//
//  HomeScreen.swift
//  FirePerfect
//
//  Created by Oybek To’laboyev on 16/10/21.
//

import SwiftUI
import Firebase



struct HomeScreen: View {
    
    @EnvironmentObject var session: SessionStore
    @ObservedObject var database = RealtimeStore()
    @State var isLoading = false
    
    func doSignOut(){
        isLoading = true
        if SessionStore().signOut(){
            isLoading = false
            session.listen()
        }
    }
    
    func apiContacts(){
        isLoading = true
        database.loadPosts {
            isLoading = false
            print(database.items.count)
            }
        }
    
    
    var body: some View {
        NavigationView{
            ZStack{
                
                List{
//                    Text("HELLO")
                    ForEach(database.items, id:\.self){ item in
                        ContactCell(contact: item)
                    }
                }.listStyle(PlainListStyle())
                
                if isLoading{
                    ProgressView()
                }
}
            .navigationBarItems(trailing:
                                    HStack{
                NavigationLink(
                    destination: AddPostScreen()) {
                        Image(systemName: "plus.square")
                    }
                Button {
                    doSignOut()
                } label: {
                    Image(systemName: "arrow.backward.square")
                }

                
            })
            .navigationBarTitle("Contacts", displayMode: .inline)
            
        }.onAppear{
            apiContacts()
        }
    }
    
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
