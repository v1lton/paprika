//
//  LoginScreen.swift
//  paprika
//
//  Created by Hugo Santos on 15/07/21.
//
import AuthenticationServices
import SwiftUI

struct AppleUser: Codable {
    let userId: String
    let firstName: String
    let lastName: String
    let email: String
    
    init?(credentials: ASAuthorizationAppleIDCredential){
        guard
            let firstName = credentials.fullName?.givenName,
            let lastName = credentials.fullName?.familyName,
            let email = credentials.email
        else {return nil}
        
        self.userId = credentials.user
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
    }
}

struct LoginScreen: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        SignInWithAppleButton(
            .signIn,
            onRequest: configure,
            onCompletion: handle)
            .signInWithAppleButtonStyle(colorScheme == .dark ? .white : .black)
            .frame(height: 45)
            .padding()
    }
}
    func configure(_ request: ASAuthorizationAppleIDRequest){
        request.requestedScopes = [.fullName, .email]
        //request.nonce = ""
}
    func handle(_ authResult: Result<ASAuthorization, Error>){
        switch authResult {
        case .success(let auth):
            print(auth)
            switch auth.credential {
            case let appleIdCredentials as ASAuthorizationAppleIDCredential:
                if let appleUser = AppleUser(credentials: appleIdCredentials),
                   let appleUserData = try? JSONEncoder().encode(appleUser){
                    UserDefaults.standard.setValue(appleUser, forKey: appleUser.userId)
                    
                    print("saved apple user", appleUser)
                } else{
                    print("missing some fields", appleIdCredentials.email, appleIdCredentials.fullName, appleIdCredentials.user)
                    guard let appleUserData = UserDefaults.standard.data(forKey: appleIdCredentials.user),
                          let appleUser = try? JSONDecoder().decode(AppleUser.self, from: appleUserData)
                    else { return }
                    
                    print(appleUser)
                }
                
            default:
                print(auth.credential)
            }
        case .failure(let error):
            print(error)
        }
    }

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
