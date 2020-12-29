//
//  StoreCardView.swift
//  TokoHijau
//
//  Created by Juansyah - on 19/09/20.
//  Copyright © 2020 Juansyah. All rights reserved.
//

import SwiftUI

struct StoreCardView: View {
    var body: some View {
        ZStack{
            Rectangle().fill(Color(lightGrayTokped)).frame(width: screenWidth*0.9, height: screenHeight*0.25).cornerRadius(10)
            
            HStack{
                Image("toy").frame(width: 40, height: 40).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                VStack{
                   Text("Hello")
                }.frame(width: screenWidth*0.5)
                
                Button(action: {
                    
                }){
                    Text("Lihat Toko")
                }
            }
        }
    }
}

struct StoreCardView_Previews: PreviewProvider {
    static var previews: some View {
        StoreCardView()
    }
}
