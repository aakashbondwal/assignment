//
//  ReadyToPlayView.swift
//  CorpAssignment
//
//  Created by Aakash  Bondwal  on 18/08/23.
//


import Foundation
import SwiftUI



struct ReadyToPlayView:View {
    
    @State var showText:Bool = false
    @State var showBody:Bool = false
    @State var showBallence:Bool = false
    @Binding var presentPlayView:Bool
    var body: some View {
        if presentPlayView{
            VStack{
                if showText{
                    Text("Ready to play?")
                        .font(.title)
                        .transition(AnyTransition.scale.animation(.easeInOut))
                    Text("OSWALD")
                        .font(.title2)
                        .transition(AnyTransition.scale.animation(.easeInOut))
                }
                
                HStack{
                    ShimmerView().frame(width:Size.screenWidth*0.05,height:Size.screenHeight*0.01)
                    ShimmerView().frame(width:Size.screenWidth*0.02,height:Size.screenHeight*0.01)
                }
                if showBody{
                    HStack{
                        ShimmerView()
                            .cornerRadius(24)
                            .frame(width:60,height:60)
                            .transition(.move(edge: .trailing))
                        ShimmerView()
                            .cornerRadius(24)
                            .frame(width:60,height:60)
                            .transition(.move(edge: .trailing))
                        ShimmerView()
                            .cornerRadius(24)
                            .frame(width:60,height:60)
                            .transition(.move(edge: .trailing))
                    }.transition(.move(edge: .trailing))
                }
                if showBallence{
                    HStack{
                        Text("Wallet Balance:")
                            .transition(.move(edge: .bottom))
                        ShimmerView().frame(width:Size.screenWidth*0.15,height: Size.screenHeight*0.015)
                            .transition(.move(edge: .bottom))
                        Spacer()
                        HStack{
                            ShimmerView().frame(width:Size.screenWidth*0.13,height: Size.screenHeight*0.017)
                                .transition(.move(edge: .bottom))
                            ShimmerView().frame(width:Size.screenWidth*0.1,height: Size.screenHeight*0.01)
                                .transition(.move(edge: .bottom))
                        }
                    }.transition(.move(edge: .bottom))
                        .padding()
                }
                Button(action: {
                    
                }, label: {
                    Text("Confirm").foregroundColor(.white)
                        .frame(width:Size.screenWidth*0.8,height:Size.screenHeight*0.08)
                        .background(Color.black)
                        .cornerRadius(10)
                }).transition(AnyTransition.scale.animation(.easeIn))
            }.onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
                    self.showText.toggle()
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.9){
                    self.showBody.toggle()
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4){
                    self.showBallence.toggle()
                }
                
                
            }
            
            .animation(.easeIn)
        }
    }
}
