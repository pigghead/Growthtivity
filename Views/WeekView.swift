//
//  WeekView.swift
//  Growthtivity
//
//  Created by Justin Armstrong on 11/26/19.
//  Copyright © 2019 Justin Armstrong. All rights reserved.
//

import SwiftUI

struct WeekView: View {
    let weekDays:[String] = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    
    var body: some View {
        NavigationView {
            List {  // Dynamic list here
                ForEach(weekDays, id: \.self) { day in
                    link(text: day, destination: DayView(Day: day))
                }
            }
            .navigationBarTitle(Text("Days"))
        }
    }
}

// Helper function to reduce how much space is taken up
// - FIX - Currently used in two locations (D.R.Y)
private func link<Destination: View>(text: String, destination: Destination) -> some View {
    return NavigationLink(destination: destination) {
        Text(text)
    }
}

struct WeekView_Previews: PreviewProvider {
    static var previews: some View {
        WeekView()
    }
}
