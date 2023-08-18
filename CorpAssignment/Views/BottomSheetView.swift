//
//  BottomSheetView.swift
//  CorpAssignment
//
//  Created by Aakash  Bondwal  on 18/08/23.
//

import Foundation
import SwiftUI



struct BottomSheet:View {
    
    @Binding var showSheet : Bool
    @State var showingShimmer1:Bool = false
    @State var showingShimmer2:Bool = false
    @State var showingShimmer3:Bool = false
    @State var showingCountView:Bool = false
    var body: some View {
        if showSheet{
            if showingCountView{
                CountView(showCountView:$showingCountView)
            }else{
                VStack{
                    if showingShimmer3{
                        
                        
                    
                        ShimmerView() .transition(AnyTransition.scale.animation(.easeInOut))
                            .frame(width:Size.screenWidth*0.7,height: Size.screenWidth*0.03)
                            .cornerRadius(5)
                        
                    }
                    if showingShimmer2{
                        HStack{
                            
                            ShimmerBody()
                            
                            ShimmerBody()
                            
                        }.transition(.move(edge: .trailing))
                    }
                    
                    Button(action: {
                        self.showingCountView.toggle()
                    }, label: {
                        Text("Next").foregroundColor(.white)
                            .frame(width:Size.screenWidth*0.8,height:Size.screenHeight*0.06)
                            .background(Color.green)
                            .cornerRadius(10)
                    })
                    
                    
                }.onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.8){
                        self.showingShimmer1.toggle()
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.10){
                        self.showingShimmer2.toggle()
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.12){
                        self.showingShimmer3.toggle()
                    }
                    
                    
                }
                .animation(.easeIn)
                
            }
            
            
        }
    }
}
