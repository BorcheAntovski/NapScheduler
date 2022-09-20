//
//  AppViewModel.swift
//  NapScheduler
//
//  Created by Borche Antovski on 9/19/22.
//

import Foundation
import FirebaseAuth
class AppViewModel: ObservableObject {
    @Published var signedIn = false
    var auth = Auth.auth()
    
    var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    func signIn(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                print("error")
                return
            }
            
            //success
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        }
    }
    
    func signUp(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                print("error")
                return
            }
            
            //success
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        }
    }
    
    func signOut() {
        try? auth.signOut()
        
        self.signedIn = false
    }
}
