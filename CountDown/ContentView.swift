//
//  ContentView.swift
//  CountDown
//
//  Created by Cihat Tascı on 6.03.2023.
//

import SwiftUI

struct ContentView: View {
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State var counter: Int = 200
    @State var isLoop: Bool = true
    
    func stopTimer(){
        timer.upstream.connect().cancel()
    }
    
    var body: some View {
        VStack {
            Text("\(counter) is remaining")
            Button("Start") {
                stopTimer()
            }
            
            .onReceive(timer) { time in
                if counter != 0{
                    counter -= 1
                } else{
                    counter = 0
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
