//
//  Home.swift
//  CustomNavigation
//
//  Created by Quang Bao on 07/01/2022.
//

import SwiftUI

struct Home: View {
    
    @State var barColor: Color = .init(white: 0)
    @State var barTextColor: Color = .primary

    var body: some View {
        
        NavigationView{
            
            ScrollView(.vertical, showsIndicators: false){
                
                VStack(spacing: 8){
                    
                    //Navigation Bar Color
                    Text("Navigation Bar Color")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Picker(selection: $barColor) {
                        
                        //Sample Color
                        
                        Text("Clear")
                            .tag(Color.clear)
                        
                        Text("Pink")
                            .tag(Color.pink)
                        
                        Text("Purple")
                            .tag(Color.purple)
                        
                        Text("Orange")
                            .tag(Color.orange)
                        
                        Text("Cyan")
                            .tag(Color.cyan)
                        
                    } label: {
                        
                    }
                    .pickerStyle(.segmented)
                    .labelsHidden()

                    //Navigation Bar Text Color
                    Text("Navigation Bar Text Color")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Picker(selection: $barTextColor) {
                        
                        //Sample Color
                        
                        Text("Primary")
                            .tag(Color.primary)
                        
                        Text("White")
                            .tag(Color.white)
                        
                        Text("Green")
                            .tag(Color.green)
                        
                        Text("Orange")
                            .tag(Color.orange)
                        
                        Text("Yellow")
                            .tag(Color.yellow)
                        
                    } label: {
                        
                    }
                    .pickerStyle(.segmented)
                    .labelsHidden()
                    
                    //MARK: Sample Image
                    ForEach(1...15, id: \.self){ index in
                        
                        NavigationLink {
                            
                            Text("Detail View")
                                .navigationTitle("Detail")
                        } label: {
                            
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
//                                    .onTapGesture {
//                                        setNavbarColor(color: .clear)
//                                    }
                            }
                            .frame(height: 180)
                        }
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
            //Updating Color
            .onChange(of: barColor) { newValue in
                setNavbarColor(color: barColor)
            }
            .onChange(of: barTextColor) { newValue in
                setNavbarTitleColor(color: barTextColor)
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
