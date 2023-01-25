//
//  CustomTabbarViewController.swift
//  Transo
//
//  Created by mac on 08/05/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit

class CustomTabbarViewController: UITabBarController {
    
    var array = [UIImage]()
    var selected = [UIImage]()
    override func viewDidLoad() {
        super.viewDidLoad()
      //  self.tabBar.selectedIndex = 2
        array.append(#imageLiteral(resourceName: "home"))
        array.append(#imageLiteral(resourceName: "speech-bubble-2"))
        array.append(#imageLiteral(resourceName: "privacy"))
        array.append(#imageLiteral(resourceName: "shopping-list"))
     
        
        tabBar.layer.borderWidth = 2
        tabBar.layer.borderColor = #colorLiteral(red: 0.8562618972, green: 0.8562618972, blue: 0.8562618972, alpha: 0.4960402397)
        
//        UITabBar.appearance().shadowImage = UIImage.colorForNavBar(color: UIColor.init(red: 120/255.0, green: 120/255.0, blue: 120/255.0, alpha: 1.0))
        
        
        
        UITabBarItem.appearance().setTitleTextAttributes(
                [NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 12),
                  NSAttributedString.Key.foregroundColor: UIColor.gray], for: .normal)
        
        
        UITabBarItem.appearance().setTitleTextAttributes(
                [NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 12),
                 NSAttributedString.Key.foregroundColor: UIColor(hexString: "#EC644C")], for: .selected)
        
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.red], for: .selected)

        
//        self.tabBar.layer.cornerRadius = 20
//        self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
//        self.tabBar.layer.masksToBounds = true
      
       
        
        for i in self.tabBar.items!{
        
            let image = i.image
            i.image = image?.withRenderingMode(.alwaysOriginal)
            i.selectedImage = image?.withRenderingMode(.alwaysOriginal)
            if i.tag == 1
            {
//                self.tabBar.layer.cornerRadius = 20
//                self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
//                self.tabBar.layer.masksToBounds = true
                i.selectedImage = array[1].withRenderingMode(.alwaysOriginal)
               // UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.red], for: .selected)
            }
            if i.tag == 0
            {
//                self.tabBar.layer.cornerRadius = 20
//                self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
//                self.tabBar.layer.masksToBounds = true
                i.selectedImage = array[0].withRenderingMode(.alwaysOriginal)
                //UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.red], for: .selected)
            }
            if i.tag == 2
            {
//                self.tabBar.layer.cornerRadius = 20
//                self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
//                self.tabBar.layer.masksToBounds = true
                i.selectedImage = array[2].withRenderingMode(.alwaysOriginal)
               
            }
            if i.tag == 3
            {
//                self.tabBar.layer.cornerRadius = 20
//                self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
//                self.tabBar.layer.masksToBounds = true
                i.selectedImage = array[3].withRenderingMode(.alwaysTemplate)
           
            }
            if i.tag == 4
            {
//                self.tabBar.layer.cornerRadius = 20
//                self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
//                self.tabBar.layer.masksToBounds = true
                i.selectedImage = array[4].withRenderingMode(.alwaysTemplate)
                i.title = "dada"
           
            }
            
            
        }
   
    }


}
extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 765)
    }
}
