//
//  ContentView.swift
//  Growthtivity
//
//  Created by Justin Armstrong on 11/25/19.
//  Copyright © 2019 Justin Armstrong. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //Text("Hello, World!")
        TabView {
            WeekView()
                .font(.title)
                .tabItem ({
                    Image(systemName: "list.bullet")
                    Text("Tasks")
                })
                .tag(0)
            
            StatsView()
                .font(.title)
                .tabItem {
                    Image(systemName: "chart.bar")
                    Text("Statistics")
                }
                .tag(1)
            
            SettingsView()
                .font(.title)
                .tabItem ({
                    Image(systemName: "hexagon")
                    Text("Settings")
                })
                .tag(2)
        }.accentColor(.green)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone 11 Pro Max", "iPhone 8 Plus", "iPad (5th generation)"], id: \.self) { deviceName in
            ContentView()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
                //.environmentObject(ud())
        }
        //ContentView()
    }
}
