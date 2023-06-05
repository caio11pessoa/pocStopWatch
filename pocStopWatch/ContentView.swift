//
//  ContentView.swift
//  pocStopWatch
//
//  Created by userext on 24/05/23.
//

import SwiftUI

struct ContentView: View {
    @State var progress: Double = 0
    @State private var counter = 120
    let color = Color(red: 59/255, green: 129/255, blue: 235/255)
    let initCounter = 120
    var minuts : Int {
        return counter / 60
    }
    
    var seconds: Int {
        return counter % 60
    }
    @State private var timer: Timer?
    
    func numbersFormated(_ number: Int)-> String{
        if(number < 10){
            return "0\(number)"
        }
        return "\(number)"
    }
    
    var body: some View {
        VStack {
            ZStack {
                CircularProgressView(progress: getProgress())
                VStack(spacing:20) {
                    Text("\(numbersFormated(minuts)):\(numbersFormated(seconds))")
                        .font(.largeTitle)
                        .foregroundColor(color)
                        .bold()
                    HStack {
                        Button {
                            stopTimer()
                        } label: {
                            Image(systemName: "trash.fill").foregroundColor(color)
                        }
                        Button {
                            if(timer == nil) {
                                startTimer()
                            }else {
                                stopTimer()
                            }
                        } label: {
                            if(timer == nil) {
                                Image(systemName: "play.fill")
                                    .padding(.bottom, 10)
                            }else {
                                Image(systemName: "pause.fill")
                                    .padding(.bottom, 10)
                            }
                        }
                        Button {
                            resetTimer()
                        } label: {
                            Image(systemName: "stop.fill")
                        }
                    }.scaledToFill()
                }
                
            }.frame(width: 280, height: 280)
            Spacer()
            HStack {
                Slider(value: $progress, in: 0...1)
                Button("Reset") {
                    resetProgress()
                }.buttonStyle(.bordered)
            }
            
            Text("\(minuts):\(seconds)")
            Button(action: {
                startTimer()
            }) {
                Text("Start")
                    .font(.title)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            Button(action: {
                stopTimer()
            }) {
                Text("Stop")
                    .font(.title)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            Button(action: {
                resetTimer()
            }) {
                Text("reset")
                    .font(.title)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }.font(.largeTitle)
            .padding()
    }
    
    func getProgress() -> Double{
        
        return  Double(initCounter - counter) / Double(initCounter)
    }
    
    func resetProgress() {
        progress = 0
    }
    
    func startTimer() {
        if(timer == nil){
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { _ in
                counter -= 1
            })
        }
        if(counter <= 0) {
            stopTimer()
        }
    }

    
    func resetTimer(){
        timer?.invalidate()
        timer = nil
        counter = 120
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func getMinuts() -> Int {
        return seconds
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

