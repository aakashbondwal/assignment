//
//  ContentView.swift
//  CorpAssignment
//
//  Created by Aakash  Bondwal  on 18/08/23.
//


import SwiftUI


struct ContentView: View {
    @State var changePosition:Bool = false
    var body: some View {
        VStack {
            ZStack{
                
                
                //creating ui first app in the list
                VStack{
                    HStack{
                        
                        //app icon for the first app
                        RoundedRectangle(cornerSize: CGSize(width: 20, height: 10))
                            .foregroundColor(.yellow)
                            .frame(width: Size.screenWidth*0.25,height:Size.screenHeight*0.08)
                            .offset(x: changePosition ? -10 : 0 , y : changePosition ? -100 :  0)
                        if changePosition{
                            
                            CandyCrush().offset(x:-10,y:-100)
                            
                        } else {
                            Spacer()
                        }
                        
                    }.padding()
                    Spacer()
                    if changePosition {
                        
                        
                        //animation for the app description images
                        AppInfo(show: $changePosition)
                        
                    }else{
                        
                        //green button for view more about the first app
                        
                        RoundedRectangle(cornerSize: CGSize(width: 20, height: 10)).foregroundColor(.green)
                            .frame(width:Size.screenWidth*0.8,height:Size.screenHeight*0.05)
                            .padding()
                    }
                }
            } .frame(width:Size.screenWidth*0.9,height: Size.screenHeight*0.6)
                .background(changePosition ? Color.white : Color.orange)
                .onTapGesture {
                    changePosition.toggle()
                }
            if changePosition{
               
            } else {
                
                //app 2 in the app list
                
                Rectangle()
                    .foregroundColor(.orange)
                    .frame(width:Size.screenWidth*0.9,height:Size.screenHeight*0.12)
            }
        }
        .padding()
        .animation(.easeIn)
    }
}




struct CandyCrush:View {
    @State private var isRotating = 0.0
    var body: some View {
        HStack{
            
            
            //APP NAME
            
            Text("CANDY CRUSH")
                .foregroundColor(.black)
            
            
            
            Spacer()
            
            
            
            //CANCEL BUTTON
            
            Image(systemName: "multiply")
            //ROTATING THE CROSS BUTTON INTO 360 AS PER THE ASSIGNMENT
                .rotationEffect(.degrees(isRotating))
                .onAppear {
                    withAnimation(.linear(duration: 1)
                        .speed(3.0).repeatForever(autoreverses: false)) {
                            isRotating = 360.0
                        }
                }
                
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
