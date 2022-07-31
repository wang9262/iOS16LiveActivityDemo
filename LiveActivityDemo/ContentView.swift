//
//  ContentView.swift
//  LiveActivityDemo
//
//  Created by Vong on 2022/7/30.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Button {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    LiveActivityManager.start()
                }
            } label: {
                Text("Start")
            }
            
            
            Button {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    LiveActivityManager.update()
                }
                
            } label: {
                Text("Update")
            }
            
            Button {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    LiveActivityManager.end()
                }
            } label: {
                Text("End")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
