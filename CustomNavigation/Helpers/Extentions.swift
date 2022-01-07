//
//  Extentions.swift
//  CustomNavigation
//
//  Created by Quang Bao on 07/01/2022.
//

import SwiftUI

//MARK: Customization Options for Navigation Bar
extension View{
    
    func setNavbarColor(color: Color) {
        
    }
    
    func setNavbarTitleColor(color: Color) {
        
    }
}

//MARK: NavigationController Helpers
extension UINavigationController{
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        //Since it's base navigation Controller load method
        //so what ever changes done here will reflect on navigation bar
        
//        navigationBar.largeTitleTextAttributes = [.foregroundColor : UIColor.gray]
        navigationBar.largeTitleTextAttributes = [.foregroundColor : UIColor.init(named: "TextColor") ?? .gray]
//        navigationBar.titleTextAttributes = [.foregroundColor : UIColor.gray]
        navigationBar.titleTextAttributes = [.foregroundColor : UIColor.init(named: "TextColor") ?? .gray]

    }
}
