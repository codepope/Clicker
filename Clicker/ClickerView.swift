//
//  ContentView.swift
//  Clicker
//
//  Created by Dj Walker-Morgan on 27/12/2023.
//

import SwiftUI
import Combine


struct ClickerView: View {
    @State var seconds: Int
    @State var ticking: Bool
    @State var count: Int
    @State var remainSeconds: Int
    @State private var timer: Publishers.Autoconnect<Timer.TimerPublisher>? // << here !!
    @State private var golabel="Go"
    
    let generator = UINotificationFeedbackGenerator()

    var body: some View {
        VStack {
            if timer != nil {
                Text("\(remainSeconds)").padding().font(.custom("Menlo", size: 128, relativeTo: .headline)).frame(width: .infinity,height:200.0).border(Color.black, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/).frame(width:300,height:300).onReceive(timer!) { time in
                    if(ticking) {
                        if remainSeconds > 0 {
                            remainSeconds -= 1
                        } else {
                            generator.notificationOccurred(.success)
                            ticking=false
                            golabel="Go"
                            count+=1
                        }
                        
                    }
                }
            } else {
                Text("--").padding().font(.custom("Menlo", size: 128, relativeTo: .headline)).frame(width: .infinity,height:200.0).border(Color.black,width:1).padding()
            }
                Stepper((seconds>0) ? "Start at \(seconds)s" : "Count only",
                        value: $seconds,
                        in: 0...140,
                        step: 10
                ).padding().font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
         
            
            Text("Count: \(count)").padding().font(.largeTitle).foregroundColor(.blue)
            Button("Reset") {
                if(!ticking) {
                    count=0
                }
            }.padding().disabled(ticking).buttonStyle(.borderedProminent)
            Button {
                if !ticking {
                    if (seconds>0) {
                        remainSeconds=seconds
                        ticking=true
                        golabel="Reps"
                        timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()    // << create !!
                    } else {
                        count+=1
                    }
                }
            } label: {
                Text("\(golabel)").font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/).fontWeight(.heavy).padding(100.0)
            }.disabled(ticking).buttonStyle(.bordered)
        }
    }
}

#Preview {
    ClickerView(seconds:10,ticking:false,count:0,remainSeconds:0)
}
