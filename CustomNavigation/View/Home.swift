//
//  Home.swift
//  CustomNavigation
//
//  Created by Quang Bao on 07/01/2022.
//

import SwiftUI

struct Home: View {
    var body: some View {
        
        NavigationView{
            
            ScrollView(.vertical, showsIndicators: false){
                
                VStack(spacing: 8){
                    
                    ForEach(1...15, id: \.self){ index in
                        
                        GeometryReader{ proxy in
                            
                            let size = proxy.size
                            
                            Image("Post\(index)")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: size.width, height: size.height)
                                .cornerRadius(10)
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(.gray, lineWidth: 1))
//                                .onTapGesture {
//                                    NotificationCenter.default.post(name: NSNotification.Name("UPDATENAVBAR"), object: nil)
//                                }
                                .onTapGesture {
                                    setNavbarColor(color: .clear)
                                }
                        }
                        .frame(height: 180)
                    }
                }
                .padding(8)
            }
            .navigationTitle("Menu")
            .toolbar {
                Button {
                    resetNavBar()
                } label: {
                    Text("RESET")
                }

            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            //.PreviewDevice("iPhone 13 Pro")
    }
}
