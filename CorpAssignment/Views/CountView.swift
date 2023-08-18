//
//  CountView.swift
//  CorpAssignment
//
//  Created by Aakash  Bondwal  on 18/08/23.
//

import Foundation
import SwiftUI

struct CountView:View {
    let height = UIScreen.main.bounds.size.height
    let width = UIScreen.main.bounds.size.width
    @State var showHead: Bool = false
    @State var showWallet:Bool = false
    @State var showPrice:Bool = false
    @Binding var showCountView:Bool
    @State var presentingPlayView:Bool = false
    var body: some View {
        if showCountView{
            if presentingPlayView{
                ReadyToPlayView(presentPlayView: $presentingPlayView)
            }else{
                VStack{
                    if showHead{
                        ShimmerView().frame(width:width*0.3,height: height*0.015)
                            .transition(AnyTransition.scale.animation(.easeInOut))
                    }
                 ShimmerView().frame(width:width*0.25,height: height*0.012)
                    if showPrice{
                        HStack{
                            ZStack{
                                Circle()
                                    .frame(width:60,height:60)
                                    .foregroundColor(Color.green)
                                Text("5").foregroundColor(.white)
                            }.transition(.move(edge: .trailing))
                            ZStack{
                                ShimmerView()
                                    .cornerRadius(30)
                                    .frame(width:60,height:60)
                                    .transition(.move(edge: .trailing))
                                Text("10")
                            }
                            ZStack{
                                ShimmerView()
                                    .cornerRadius(30)
                                    .frame(width:60,height:60)
                                    .transition(.move(edge: .trailing))
                                Text("15")
                            }
                        } .transition(.move(edge: .trailing))
                    }
                    if showWallet{
                        
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
                        self.presentingPlayView.toggle()
                    }, label: {
                        Text("Next").foregroundColor(.white)
                            .frame(width:width*0.8,height:height*0.08)
                            .background(Color.green)
                            .cornerRadius(10)
                    })
                }.onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
                        self.showHead.toggle()
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.9){
                        self.showPrice.toggle()
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.4){
                        self.showWallet.toggle()
                    }
                    
                    
                }
                
                .animation(.easeIn)
            }
        }
    }
}
