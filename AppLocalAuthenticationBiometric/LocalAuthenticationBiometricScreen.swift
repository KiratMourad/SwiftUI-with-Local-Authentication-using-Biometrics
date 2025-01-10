//
//  ContentView.swift
//  AppLocalAuthenticationBiometric
//
//  Created by Mourad KIRAT on 9/1/2025.
//

import SwiftUI

struct LocalAuthenticationBiometricScreen: View {
    @State private var isAuthenticated:Bool = false
    @State private var message:String = "Use your fingerprint."
    private let localAuthentication = LocalAuthenticationManager()
    var body: some View {
        // Start zSatck
        ZStack{
            Color.black
                .ignoresSafeArea()
      // Start VStack
        VStack {
            Text(self.message)
                .font(.system(size: 25))
                .bold()
                .foregroundColor(Color.white)
                .padding()
         if self.isAuthenticated  == false{
                
      
            Button(action: {
                // Close this view
                
                self.isAuthenticated = localAuthentication.biometricUser()
                print(self.isAuthenticated )
                
            } ) {
                Image("finger_print")
                .resizable()
                   .scaledToFit()
                    .frame(width: 220.0, height: 220.0)
            }.frame(maxWidth: .infinity, alignment: .center)
          } // End if
      
        } // End VStack
        .onChange(of: self.isAuthenticated){
          
        self.message = localAuthentication.messageAuthenticated()
          
        }
        } // End ZStack
      
    }
}

#Preview {
    LocalAuthenticationBiometricScreen()
}
