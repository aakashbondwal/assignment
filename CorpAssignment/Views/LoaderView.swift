//
//  LoaderVIew.swift
//  CorpAssignment
//
//  Created by Aakash  Bondwal  on 18/08/23.
//

import Foundation
import SwiftUI


struct LoaderView : View {
    @State var percent : CGFloat = 0
    @State private var downloadItem  = 0.0
    
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @Binding var showLoader:Bool
    @State var showingButton:Bool = false
    @State var showingBsheet:Bool = false
    var body: some View {
        if showLoader{
            HStack{
                if showingButton{
                    
                    //this shows play button after downloading is completed
                    
                    PlayButton(showButton: $showingButton).transition(.move(edge: .bottom))
                        .onTapGesture {
                            
                            
                            //it shows bottom sheet when we press play button
                            self.showingBsheet.toggle()
                        }
                } else {
                    ZStack{
                        VStack{
                            
                        }
                        .frame(width:Size.screenWidth*0.8,height:Size.screenHeight*0.04)
                        .background(Color.green)
                        ProgressView(value: downloadItem, total: 100)
                            .accentColor(.orange)
                            .scaleEffect(x: 1, y: 10, anchor: .center)
                        Text("Downloading...")
                            .font(.system(size: 10))
                            .bold()
                            .foregroundColor(.white)
                    }
                    
                    //checkmark or cancel downloading button right next to the doownloading bar
                    
                    if downloadItem == 100 {
                        Image(systemName: "checkmark.circle.fill")
                    } else {
                        Image(systemName: "multiply.circle.fill")
                    }
                }
            }.onReceive(timer) { _ in
                if downloadItem < 100{
                    downloadItem += 1
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 11){
                    self.showingButton.toggle()
                }
            }
            .sheet(isPresented: $showingBsheet) {
                BottomSheet(showSheet: $showingBsheet)
                //size of the bottom sheet to be shown in the view
                    .presentationDetents([.fraction(0.50)])
            }
        }
    }
}



struct PlayButton:View {
    
    @Binding var showButton:Bool
    var body: some View {
        if showButton{
            
            Text("Play").foregroundColor(.white)
                .frame(width:Size.screenWidth*0.8,height:Size.screenHeight*0.05)
                .background(Color.blue)
                .cornerRadius(10)
            
        }
    }
}
