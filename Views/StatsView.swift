//
//  StatsView.swift
//  Growthtivity
//
//  Created by Justin Armstrong on 11/26/19.
//  Copyright © 2019 Justin Armstrong. All rights reserved.
//

import SwiftUI

struct StatsView: View {
    
    var body: some View {
        VStack {
            Text("This is the statistics page. I intend for there to be various amounts of charts and additional data (for nerds!) so that they can see how much time they have spent towards various tasks (hence a timer/ability to track time spent on a task)")
                .padding()
            
//            Text("0:00:00")
//                .font(.largeTitle)
//                .fontWeight(.semibold)
//
//            HStack {
//                Image(systemName: "play")
//                    .imageScale(.large)
//                Image(systemName: "stop")
//                    .imageScale(.large)
//            }
                
            
            Spacer()
            
            Text("Charts tutorial here: https://medium.com/better-programming/swiftui-bar-charts-274e9fbc8030")
                .padding()
        }
    }
}

struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView()
    }
}
