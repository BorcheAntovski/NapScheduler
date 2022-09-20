//
//  ContentView.swift
//  NapScheduler
//
//  Created by Borche Antovski on 9/18/22.
//

import SwiftUI
struct ContentView: View {
    
    @State var username: String = ""
    @State var password: String = ""
    
    @EnvironmentObject var viewModel : AppViewModel
    
     
    var body: some View {
        NavigationView{
            if viewModel.signedIn {
                VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            viewModel.signOut()
                        }, label: {
                            Text("Sign Out")
                                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                                .cornerRadius(5.0)
                                .padding()
                        })
                    }
                    Spacer()
                    Text("You are signed in")
                    Spacer()
                }
                
            } else {
                HStack {
                    LogInView()
                }
            }
            
        }
        .onAppear {
            viewModel.signedIn = viewModel.isSignedIn
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
