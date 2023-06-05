//
//  CircularProgressView.swift
//  pocStopWatch
//
//  Created by userext on 25/05/23.
//

import SwiftUI

struct CircularProgressView: View {
    let progress: Double
    let lineWidth: CGFloat = 4.27091 * 1.5
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color(red: 212/255, green: 226/255, blue: 248/255),
                lineWidth: lineWidth
            )
            Circle()
                .trim(from: 0, to: progress)
//                .rotation(Angle.degrees(-90))
                .stroke(Color(red: 59/255, green: 129/255, blue: 235/255), style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                .rotationEffect(.degrees(-90))
                .animation(.easeOut, value: progress)
        }
        
    }
}

struct CircularProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressView(progress: 0.1)
    }
}
