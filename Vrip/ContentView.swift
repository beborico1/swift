//
//  ContentView.swift
//  Vrip
//
//  Created by Diego Gomez on 29/05/20.
//  Copyright © 2020 VripInc. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var session: SessionStore
    
    func getUser() {
        session.listen()
    }
    
    var body: some View {
                Group {
                    if (session.session != nil) {
                        Button(action: session.signOut) {
                               Text("Sign Out")
                           }
                        
                        
                            BrandListView()
                        
                        
                        
                        } else {
                        AuthView()
                    }
                } .onAppear(perform: getUser)
            }
        }

struct BrandList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
        ContentView()
            .environmentObject(SessionStore())
            .previewDevice(PreviewDevice(rawValue: deviceName))
            .previewDisplayName(deviceName)
        }
    }
}
