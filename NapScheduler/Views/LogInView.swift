//
//  loginView.swift
//  NapScheduler
//
//  Created by Borche Antovski on 9/19/22.
//

import SwiftUI

struct LogInView: View {
    @EnvironmentObject var viewModel:AppViewModel
    
    @State var username: String = ""
    @State var password: String = ""
    var body: some View {
            VStack() {
                Spacer()
                Image("logo")
                Spacer()
                VStack(){
                    TextField("Email", text: $username)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .foregroundColor(.black)
                        .cornerRadius(10.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color(UIColor.blue), lineWidth: 1)
                        )
                        
                        .padding(.bottom, 10)
                    SecureField("Password", text: $password)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .foregroundColor(.blue)
                        .cornerRadius(10.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color(UIColor.blue), lineWidth: 1)
                        )
                        .padding(.bottom, 10)
                    
                    Button(action: {
                        guard !username.isEmpty, !password.isEmpty else {
                            return
                        }
                        viewModel.signIn(email: username, password: password)
                    }, label: {
                        Text("Log in")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 220, height: 60)
                            .background(Color.blue)
                            .cornerRadius(15.0)
                        
                    }).padding(.bottom, 10)
                    Divider().background(Color.black)
                    NavigationLink("Don't have an account yet? Sign Up", destination: SignUpView())
                        .padding()
                        .foregroundColor(.black)
                }
                Spacer()
                Text("SleepNapper © 2022")
                
                
            }.padding()
        }
}
