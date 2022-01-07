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
                
                VStack(spacing: 15){
                    
                    ForEach(1...15, id: \.self){ index in
                        
                        GeometryReader{ proxy in
                            
                            let size = proxy.size
                            
                            Image("Post\(index)")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: size.width, height: size.height)
                                .cornerRadius(10)
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(.gray, lineWidth: 1))
                        }
                        .frame(height: 180)
                        .padding(.horizontal, 5)
                    }
                }
            }
            .navigationTitle("Menu")
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            //.PreviewDevice("iPhone 13 Pro")
    }
}
