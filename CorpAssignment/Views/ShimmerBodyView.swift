//
//  ShimmerBodyView.swift
//  CorpAssignment
//
//  Created by Aakash  Bondwal  on 18/08/23.
//


import Foundation
import SwiftUI


struct ShimmerBody:View {
    
    
    var body: some View {
        VStack{
            ShimmerView()
                .cornerRadius(30)
                .frame(width:60,height:60)
            ShimmerView()
                .frame(width:Size.screenWidth*0.3,height: Size.screenHeight*0.015)
            ShimmerView()
                .frame(width:Size.screenWidth*0.2,height: Size.screenHeight*0.015)
        }.transition(.move(edge: .trailing))
        
    }
}
