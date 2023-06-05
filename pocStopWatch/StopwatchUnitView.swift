//
//  StopwatchUnitView.swift
//  pocStopWatch
//
//  Created by userext on 24/05/23.
//

import SwiftUI

struct StopwatchUnitView: View {

    var timeUnit: Int

    /// Time unit expressed as String.
    /// - Includes "0" as prefix if this is less than 10
    var timeUnitStr: String {
        let timeUnitStr = String(timeUnit)
        return timeUnit < 10 ? "0" + timeUnitStr : timeUnitStr
    }

    var body: some View {
        HStack (spacing: 2) {
            Text(timeUnitStr.substring(index: 0))
                                    .font(.system(size: 48))
                                    .frame(width: 28)
            Text(timeUnitStr.substringIn(index: 1)).frame(width: 10)
        }
    }
}

struct StopwatchUnitView_Previews: PreviewProvider {
    static var previews: some View {
        StopwatchUnitView()
    }
}
