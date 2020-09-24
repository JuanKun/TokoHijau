//
//  MainView.swift
//  TokoHijau
//
//  Created by Juansyah - on 17/09/20.
//  Copyright © 2020 Juansyah. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @State var searchText : String = "Masker Wajah"
    @State var isSelected : Int = 0
    @State var isOptionsSelected : Int = 100
    @State var isFilter : Bool = false
    @State var products : Int = 2
    var body: some View {
        ZStack {
            VStack{
                Spacer(minLength: 0)
                
                //Navigation
                NavigationView(searchText: $searchText, isTabBarSelected: $isSelected)
                
                Divider()
                
                //TabBar
                TabBar(isSelected: $isSelected)
                
                //Contents Stand Here
                if isSelected == 0 {
                    ScrollOption(isOptionsSelected: $isOptionsSelected, isFilter: $isFilter)
                    ZStack{
                        Rectangle().fill(Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 0))).edgesIgnoringSafeArea([.top,.bottom])
                        VStack{
                            HStack{
                                ForEach(0..<products) {  _ in
                                    ProductCardView(ratings: 5, reviews: 100).padding(.leading,8)
                                }
                            }.frame(width: screenWidth).padding(.leading,-8)
                            
                            HStack{
                                ForEach(0..<products) {  _ in
                                    ProductCardView(ratings: 5, reviews: 100).padding(.leading,8)
                                }
                            }.frame(width: screenWidth).padding(.leading,-8)
                        }
                        
                    }
                }
                else{
                    ZStack{
                        Rectangle().fill(Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 0.3))).edgesIgnoringSafeArea(.bottom)
                        Text("Toko").font(.title)
                    }
                }
            }
            BottomSheetModal(display: $isFilter) {
                Text("Filter View").fontWeight(.bold)
            }
        }
    }
}

struct NavigationView: View {
    @Binding var searchText : String
    @Binding var isTabBarSelected : Int
    var body: some View{
        VStack{
            HStack{
                Button(action: {
                    
                }){
                    Image(systemName: "chevron.left").resizable().frame(width: screenWidth*0.03, height: screenWidth*0.05)
                }.foregroundColor(Color(.darkGray)).padding(.leading,0)
                HStack{
                    if isTabBarSelected == 1 {
                        ZStack{
                            Rectangle().fill(Color(searchbarColor)).frame(width: screenWidth*0.7, height: screenWidth*0.07).cornerRadius(8)
                            HStack{
                                Image(systemName: "magnifyingglass").resizable().frame(width: screenWidth*0.03, height: screenWidth*0.03)
                                
                                TextField("masker wajah", text: $searchText).frame(width: screenWidth*0.55, height: screenWidth*0.04).font(.footnote)
                                
                                Image(systemName: "multiply.circle").resizable().resizable().frame(width: screenWidth*0.03, height: screenWidth*0.03)
                            }
                        }
                        Button(action: {
                            print("Back to Home")
                        }){
                            Image(systemName: "house.fill").foregroundColor(Color(.darkGray))
                        }
                        Button(action: {
                            print("Back to Cart")
                        }){
                            Image(systemName: "cart.fill").foregroundColor(Color(.darkGray))
                        }
                    }
                    else {
                        ZStack{
                            Rectangle().fill(Color(searchbarColor)).frame(width: screenWidth*0.6, height: screenWidth*0.07).cornerRadius(8)
                            HStack{
                                Image(systemName: "magnifyingglass").resizable().frame(width: screenWidth*0.03, height: screenWidth*0.03)
                                
                                TextField("masker wajah", text: $searchText).frame(width: screenWidth*0.45, height: screenWidth*0.04).font(.footnote)
                                
                                Image(systemName: "multiply.circle").resizable().resizable().frame(width: screenWidth*0.03, height: screenWidth*0.03)
                            }
                        }
                        Button(action: {
                            print("Back to Home")
                        }){
                            Image(systemName: "house.fill").foregroundColor(Color(.darkGray))
                        }
                        Button(action: {
                            print("Back to Cart")
                        }){
                            Image(systemName: "cart.fill").foregroundColor(Color(.darkGray))
                        }
                        Button(action: {
                            print("Change layout")
                        }){
                            Image(systemName: "rectangle.grid.2x2.fill").foregroundColor(Color(.darkGray))
                        }
                    }
                }.padding(.leading,10)
            }.padding([.leading,.trailing])
        }
    }
}

struct TabBar: View {
    @Binding var isSelected : Int
    var body: some View{
        HStack{
            VStack{
                Text("Produk").foregroundColor(isSelected == 0 ? Color(color1) : Color(.lightGray)).fontWeight(.medium)
                Rectangle().fill(isSelected == 0 ? Color(color1) : Color(.lightGray)).frame(width: screenWidth*0.5, height: 1)
            }.frame(width: screenWidth*0.45, height: screenHeight*0.05).padding(.leading).onTapGesture {
                //WriteCodeHere
                self.isSelected = 0
            }
            
            VStack{
                Text("Toko").foregroundColor(isSelected == 1 ? Color(color1) : Color(.lightGray)).fontWeight(.medium)
                Rectangle().fill(isSelected == 1 ? Color(color1) : Color(.lightGray)).frame(width: screenWidth*0.5, height: 1)
            }.frame(width: screenWidth*0.45, height: screenHeight*0.05).padding(.trailing).onTapGesture {
                //WriteCodeHere
                self.isSelected = 1
            }
        }
    }
}

struct ScrollOption: View {
    @Binding var isOptionsSelected : Int
    @Binding var isFilter : Bool
    var body: some View{
        HStack{
            HStack{
                if isOptionsSelected > 0 {
                    Text("\(isOptionsSelected)").font(.caption).padding(.leading,3).padding(.trailing,3).padding(.top,1).padding(.bottom,1).overlay(RoundedRectangle(cornerRadius: 10).foregroundColor(Color(color1))).overlay(Text("\(isOptionsSelected)").font(.caption).foregroundColor(.white))
                }else{
                    Image(systemName: "slider.horizontal.3").foregroundColor(.secondary)
                }
                Text("Filter").foregroundColor(.secondary)
            }.padding(6)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(lightGrayTokped), lineWidth: 1)
            )
                .onTapGesture {
                    self.isFilter = true
            }
            
            //Here is the filter options
            Spacer()
            }.padding(.leading,10)
    }
}



struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
