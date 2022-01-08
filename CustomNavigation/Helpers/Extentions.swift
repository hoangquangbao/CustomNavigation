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
        
        //MARK: Updating Nav Bar Color
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
            NotificationCenter.default.post(name: NSNotification.Name("UPDATENAVBAR"), object: nil, userInfo: [
                //Sending Color
                "color" : color
            ])
        }
    }
    
    func resetNavBar() {
        
        //MARK: Resetting Nav Bar
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
            NotificationCenter.default.post(name: NSNotification.Name("UPDATENAVBAR"), object: nil)
        }
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
        
        //Choose Option1
//        navigationBar.largeTitleTextAttributes = [.foregroundColor : UIColor.gray]
//        navigationBar.titleTextAttributes = [.foregroundColor : UIColor.gray]
        
        //or Option2
//        navigationBar.largeTitleTextAttributes = [.foregroundColor : UIColor.init(named: "TextColor") ?? .gray]
//        navigationBar.titleTextAttributes = [.foregroundColor : UIColor.init(named: "TextColor") ?? .gray]
        
        //MARK: Notification Observer
        NotificationCenter.default.addObserver(self, selector: #selector(updateNavBar(notification:)), name: NSNotification.Name("UPDATENAVBAR"), object: nil)

    }
    
    @objc
    func updateNavBar(notification: Notification) {
        
//        print("Update Nav bar")
        if let info = notification.userInfo{
            
            let color = info["color"] as! Color
            
            //MARK: Updating Nav Bar Color
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = UIColor(color)
            
            navigationBar.standardAppearance = appearance
            navigationBar.scrollEdgeAppearance = appearance
            navigationBar.compactAppearance = appearance
        }
        else {

            //MARK: Reset Nav Bar
            let appearance = UINavigationBarAppearance()
            
            //To dismiss shadow
            let transparentAppearance = UINavigationBarAppearance()
            transparentAppearance.configureWithTransparentBackground()

            
            navigationBar.standardAppearance = appearance
            navigationBar.scrollEdgeAppearance = transparentAppearance
            navigationBar.compactAppearance = appearance
        }
    }
}
