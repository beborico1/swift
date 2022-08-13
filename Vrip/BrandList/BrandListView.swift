//
//  BrandListView.swift
//  Vrip
//
//  Created by Diego Gomez on 29/05/20.
//  Copyright © 2020 VripInc. All rights reserved.
//

import SwiftUI //usamos la biblioteca de Swift UI

struct BrandListView: View { //Declaramos la View de Brand List
    @EnvironmentObject var userData: UserData //creamos un environment object para traer informacion de UserData.swift
    
    
    var body: some View { //empezamos a describir la view
        
            TabView { //habra una tab
        NavigationView { //podremos navegar
            
            List{ //sera una lista
   
                
                Toggle(isOn: $userData.showFavoritesOnly) { //creamos un toggle que modifique showFavoritesOnly en userData
                    Text("Show your favorite brands only") //este sera el texto del toggle
                }
                Toggle(isOn: $userData.showStreetwearOnly) {//creamos un toggle que modifique showStreetwearOnly en userData
                    Text("Show Streetwear only") //este sera el texto del toggle
                }
                Toggle(isOn: $userData.showDesignerOnly) { //creamos un toggle que modifique showDesignerOnly en userData
                    Text("Show Designer only") //este sera el texto del toggle
                }
                
                ForEach(userData.brands) { brand in //creamos una lista por cada marca en brands
                    if !self.userData.showFavoritesOnly || brand.isFavorite { //si no esta activado Show Favorites Only o la marca si es favorita
                        if !self.userData.showStreetwearOnly || brand.category == "Streetwear" { //si no esta activado Show Streetwear Only o la marca si es streetwear
                            if !self.userData.showDesignerOnly || brand.category == "Designer" { //si no esta activado Show Designer Only o la marca si es designer
                                    NavigationLink(destination: BrandDetail(brand: brand)) //el boton llevara a Brand Detail con la marca
                                    {
                                    BrandRow(brand: brand) //mostramos la informacion de la marca
                                }
                            }
                        }
                    }
            }
        } .navigationBarTitle(Text("Vrip")) //el titulo de la navigation es Vrip
            }.tabItem { //esto sera un tab item
                Image(systemName: "house") //con icono de casa
                .font(.system(size: 25.0)) //tamaño 25
            }
            
            CameraView().tabItem { //CameraView.swift sera otro tab item
                Image(systemName: "camera") //el icono sera una camara
                .font(.system(size: 25.0)) //tamaño 25
            }
    }
}
}

struct BrandListView_Previews: PreviewProvider { // esto nos ayudara a ver el preview en la camara
    static var previews: some View {
        BrandListView()
    }
}
