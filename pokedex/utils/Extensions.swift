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
        //gradientLayer.frame = view.bounds
        
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        
                
        return gradientLayer
    }
    
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
           return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
       }
    
    
    
    
   
    
}

extension ViewController{
    
    
    
    func setupGradient(height: CGFloat,width: CGFloat,alpha: CGFloat) ->  CAGradientLayer {
        let gradient: CAGradientLayer = CAGradientLayer()
        let color0 =  UIColor(red: 110.0/255.0, green: 149.0/255.0, blue: 253.0/255.0, alpha: alpha).cgColor
        let color1 = UIColor(red: 111.0/255.0, green: 222.0/255.0, blue: 250.0/255.0, alpha: alpha).cgColor
        let color2 = UIColor(red: 141.0/255.0, green: 224.0/255.0, blue: 97.0/255.0, alpha: alpha).cgColor
        let color3 = UIColor(red: 81.0/255.0, green: 232.0/255.0, blue: 94.0/255.0, alpha: alpha).cgColor
        
        gradient.colors = [color0, color1, color2, color3]
        gradient.locations = [0.0, 0.36, 0.66, 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        
        
            gradient.frame = CGRect(x: 0.0, y: 0.0, width: width, height: height)
        
            return gradient
       }


}

extension String {
    func deletingPrefix(_ prefix: String) -> String {
        guard self.hasPrefix(prefix) else { return self }
        return String(self.dropFirst(prefix.count))
    }
}



