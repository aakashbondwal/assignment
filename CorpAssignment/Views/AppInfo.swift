//
//  Component2View.swift
//  CorpAssignment
//
//  Created by Aakash  Bondwal  on 18/08/23.
//

import Foundation
import SwiftUI



struct AppInfo:View {
    
    @Binding var show:Bool
    var description = """
Master the legendary match 3 puzzle game from King! With over a trillion matching levels played, Candy Crush Saga is the popular match 3 puzzle game.
"""
    @State var showingRect1:Bool = false
    @State var showingRect2:Bool = false
    @State var buttonTap:Bool = false
    @State var showingLoader:Bool = false
    var body: some View {
        VStack{
            VStack{
                
                //description about the app
                Text(description)
                    .lineLimit(3)
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 14))
                    .foregroundColor(.black)
                    .frame(width:Size.screenWidth*0.8)
                    .fixedSize(horizontal: false, vertical: true)
                
                Button {
                    
                } label: {
                    Text("READ MORE")
                        .foregroundColor(.green)
                }
            }
            Spacer()
            if show {
                    HStack{
                        
                        //app description images
                        
                        RectangleBox(showing: $showingRect1)
                            .transition(.move(edge: .trailing))
                        RectangleBox(showing: $showingRect1)
                            .transition(.move(edge: .trailing))
                    }
            }
            if showingLoader{
                
                //downloading status
                LoaderView(showLoader: $showingLoader)
            }else {
                Button(action: {
                    self.showingLoader.toggle()
                }, label: {
                    VStack{
                        Text("Download\n30 MB")
                            .font(.system(size: 13))
                            .bold()
                            .foregroundColor(.white)
                        
                    }
                    .frame(width:Size.screenWidth*0.5,height:Size.screenHeight*0.05)
                    .background(Color.green)
                    .cornerRadius(10)
                })
            }
            
            
        }.onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                self.showingRect1.toggle()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.7){
                self.showingRect2.toggle()
            }
        }
        
    }
}
