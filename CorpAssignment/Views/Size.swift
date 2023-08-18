//
//  Size.swift
//  CorpAssignment
//
//  Created by Aakash  Bondwal  on 18/08/23.
//

import Foundation
import SwiftUI

class Size{
   static var screenHeight: CGFloat{
        get{
            return UIScreen.main.bounds.size.height
        }
    }
    
    static var screenWidth: CGFloat{
        get{
            return UIScreen.main.bounds.size.width
        }
    }
    
    static func heightPercent(percent: CGFloat)-> CGFloat{
        return screenHeight * percent
    }
    
    static func widthPercent(percent: CGFloat)-> CGFloat{
        return screenWidth * percent
    }
    
}
