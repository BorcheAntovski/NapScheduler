//
//  signupView.swift
//  NapScheduler
//
//  Created by Borche Antovski on 9/19/22.
//

import SwiftUI

struct SignUpView: View {
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
                            viewModel.signUp(email: username, password: password)
                    
                    }, label: {
                        Text("Create new account")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 300, height: 60)
                            .background(Color.black)
                            .cornerRadius(15.0)
                        
                    }).padding(.top,10)
                }
                Spacer()
                Text("SleepNapper © 2022")
                
                
            }.padding()
        }
}
