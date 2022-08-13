//
//  ContentRow.swift
//  Vrip
//
//  Created by Diego Gomez on 29/05/20.
//  Copyright © 2020 VripInc. All rights reserved.
//

import SwiftUI
import FirebaseStorage

let userScale:CGFloat = 40
let bottomButtonScale:CGFloat = 30

struct ContentRow: View {
    @State var imageURL = ""
    var body: some View {
        HStack() {
            if imageURL != "" {
                FirebaseImageView(imageURL: imageURL)
            }
        }
    }
}

func randomString(length: Int) -> String {
  let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
  return String((0..<length).map{ _ in letters.randomElement()! })
}

struct ContentRow_Previews: PreviewProvider {
    static var previews: some View {
        ContentRow()
    }
}
