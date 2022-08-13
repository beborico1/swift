//
//  UserData.swift
//  Vrip
//
//  Created by Diego Gomez on 29/05/20.
//  Copyright © 2020 VripInc. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: ObservableObject {
    @Published var showFavoritesOnly = false
    @Published var showDesignerOnly = false
    @Published var showStreetwearOnly = false


    @Published var brands = brandData
}
