//
//  RectangleBox.swift
//  CorpAssignment
//
//  Created by Aakash  Bondwal  on 18/08/23.
//

import Foundation
import SwiftUI


struct RectangleBox:View {
    
    @Binding var showing:Bool
    var body: some View {
        if showing{
            Rectangle().frame(width:Size.screenWidth*0.5,height:Size.screenHeight*0.4).foregroundColor(.gray).opacity(showing ? 0.2 : 1)
             
        }
    }
}

