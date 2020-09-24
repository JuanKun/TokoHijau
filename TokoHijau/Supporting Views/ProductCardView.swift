//
//  ProductCardView.swift
//  TokoHijau
//
//  Created by Juansyah - on 18/09/20.
//  Copyright © 2020 Juansyah. All rights reserved.
//

import SwiftUI

struct ProductCardView: View {
    @State var ratings : Int = 5
    @State var reviews : Int = 100
    var body: some View {
        ZStack{
            
            VStack(alignment: .leading){
                Image("broom").resizable().frame(width: screenWidth*0.45, height: screenWidth*0.4)
                
                Text("Sapu Lidi Serbaguna asal dari Tionghoa Tenggara dekat sungai Citarum").frame(width: screenWidth*0.45).foregroundColor(Color(labelTokped)).font(.footnote).lineLimit(2)
                
                Spacer().frame(height: 8)
                
                Text("Grosir").font(.caption).foregroundColor(Color(color1)).padding(.leading,3).padding(.trailing,3).padding(.top,2).padding(.bottom,2).background(Rectangle().fill(Color(offering)).cornerRadius(5)).padding(.leading,2)
                
                Spacer().frame(height: 4)
                
                Text("Rp 300.000").foregroundColor(Color(priceTokped)).fontWeight(.heavy).font(.callout).padding(.leading,2)
                
                Spacer().frame(height: 4)
                
                Text("Jakarta Selatan").font(.caption).foregroundColor(Color(.gray)).padding(.leading,2)
                
                Spacer().frame(height: 4)
                
                RatingView(ratings: $ratings, reviews: $reviews).padding(.leading,2)
                
            }.padding(.bottom,10).padding(.leading,2).padding(.trailing,2)
                .background(Color.white)
            }.clipShape(RoundedRectangle(cornerRadius: 10)).overlay(RoundedRectangle(cornerRadius: 10).foregroundColor(.clear)).shadow(radius: 1)
    }
}

struct RatingView: View {
    @Binding var ratings : Int
    @Binding var reviews : Int
    var body: some View{
        HStack{
            ForEach(0..<ratings){ _ in
                Spacer().frame(width: 2)
                Image(systemName: "star.fill").resizable().frame(width: screenWidth*0.03, height: screenWidth*0.03).padding(.leading,0).foregroundColor(Color(ratingTokped))
            }
            Text("(\(reviews))").font(.caption).foregroundColor(Color(.lightGray))
        }
        
    }
}

struct ProductCardView_Previews: PreviewProvider {
    static var previews: some View {
        ProductCardView()
    }
}
