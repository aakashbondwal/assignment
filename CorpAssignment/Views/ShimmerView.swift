//
//  ShimmerView.swift
//  CorpAssignment
//
//  Created by Aakash  Bondwal  on 18/08/23.
//
import Foundation
import SwiftUI


struct ShimmerView:View {
    
    private var gradientColors = [
        Color(uiColor: UIColor.systemGray5),
        Color(uiColor: UIColor.systemGray6),
        Color(uiColor: UIColor.systemGray5)]
    @State var isAnimating:Bool = false
    @State var startingPoint:UnitPoint = .init(x: -1.8, y: -1.2)
    @State var endPoint:UnitPoint = .init(x: 1, y: -0.2)
    var body: some View {
        VStack{
            LinearGradient(colors: gradientColors, startPoint: startingPoint, endPoint: endPoint)
                .onAppear(perform: {
                    withAnimation(.easeOut(duration: 5).repeatForever(autoreverses:false)) {
                        startingPoint = .init(x: 1, y: 0.5)
                        endPoint = .init(x: 2.2, y: 2.2)
                    }
                })
          
        }
    }
}
