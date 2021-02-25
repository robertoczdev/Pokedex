//
//  Extensions.swift
//  pokedex
//
//  Created by admin on 2/18/21.
//

import UIKit

extension UIColor{
    
    //MARK: Gradient colors
    
    static func setGradient() -> CAGradientLayer {
        let color0 =  UIColor(red: 110.0/255.0, green: 149.0/255.0, blue: 253.0/255.0, alpha: 1.0).cgColor
        let color1 = UIColor(red: 111.0/255.0, green: 222.0/255.0, blue: 250.0/255.0, alpha: 1.0).cgColor
        let color2 = UIColor(red: 141.0/255.0, green: 224.0/255.0, blue: 97.0/255.0, alpha: 1.0).cgColor
        let color3 = UIColor(red: 81.0/255.0, green: 232.0/255.0, blue: 94.0/255.0, alpha: 1.0).cgColor
        
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [color0, color1, color2, color3]
        gradientLayer.locations = [0.0, 0.36, 0.66, 1.0]

        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        
                
        return gradientLayer
    }
    
    static func setGradientBackground(color1: UIColor) -> CAGradientLayer {
        let white = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 250.0/255.0, alpha: 1.0).cgColor
        
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [color1, white]
        gradientLayer.locations = [0.0, 1.0]
        //gradientLayer.frame = view.bounds
        
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        
                
        return gradientLayer
    }

    
    
    
    
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
           return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
       }
    
    
    static func water() -> UIColor {
            return UIColor.rgb(red: 101, green: 175, blue: 229)
        }
    
    static func grass() -> UIColor {
            return UIColor.rgb(red: 93, green: 191, blue: 98)
        }
    static func bug() -> UIColor {
            return UIColor.rgb(red: 158, green: 194, blue: 44)
        }
    static func dark() -> UIColor {
            return UIColor.rgb(red: 95, green: 96, blue: 109)
        }
    static func dragon() -> UIColor {
            return UIColor.rgb(red: 1, green: 116, blue: 200)
        }
    static func electric() -> UIColor {
            return UIColor.rgb(red: 238, green: 214, blue: 61)
        }
    static func fairy() -> UIColor {
            return UIColor.rgb(red: 239, green: 152, blue: 31)
        }
    static func fight() -> UIColor {
            return UIColor.rgb(red: 218, green: 64, blue: 85)
        }
    
    static func fire() -> UIColor {
            return UIColor.rgb(red: 248, green: 167, blue: 78)
        }
    static func flying() -> UIColor {
            return UIColor.rgb(red: 156, green: 181, blue: 233)
        }
    static func ghost() -> UIColor {
            return UIColor.rgb(red: 105, green: 113, blue: 198)
        }
    static func ground() -> UIColor {
            return UIColor.rgb(red: 216, green: 134, blue: 84)
        }
    static func ice() -> UIColor {
            return UIColor.rgb(red: 127, green: 212, blue: 202  )
        }
    static func normal() -> UIColor {
            return UIColor.rgb(red: 155, green: 158, blue: 162)
        }
    static func poison() -> UIColor {
            return UIColor.rgb(red: 182, green: 99, blue: 207)
        }
    static func psychic() -> UIColor {
            return UIColor.rgb(red: 248, green: 125, blue: 123  )
        }
    static func steel() -> UIColor {
            return UIColor.rgb(red: 84, green: 151, blue: 165)
        }
    static func rock() -> UIColor {
            return UIColor.rgb(red: 207, green: 194, blue: 141)
        }
    
    
    
    
    
    
   
    
}



extension String {
    func deletingPrefix(_ prefix: String) -> String {
        guard self.hasPrefix(prefix) else { return self }
        return String(self.dropFirst(prefix.count))
    }
}





