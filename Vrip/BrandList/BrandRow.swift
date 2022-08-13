//
//  BrandRow.swift
//  Vrip
//
//  Created by Diego Gomez on 29/05/20.
//  Copyright © 2020 VripInc. All rights reserved.
//

import SwiftUI

struct BrandRow: View {
    var brand: Brand
    
    var body: some View {
        HStack {
            brand.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(brand.name)
            Spacer()
            
            if brand.isFavorite {
                Image(systemName: "heart.fill")
                    .imageScale(.medium)
                    .foregroundColor(.red)
            }
        }
    }
}

struct BrandRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BrandRow(
                brand: brandData[0])
            BrandRow(
                brand: brandData[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
