//
//  TaskDetailView.swift
//  Growthtivity
//
//  Created by Justin Armstrong on 12/12/19.
//  Copyright © 2019 Justin Armstrong. All rights reserved.
//

import SwiftUI

struct TaskDetailView: View {
    var title:String = ""
    var desc:String = ""
    var isUrgent:Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                    .font(.title)
                Spacer()
            }
            HStack {
                Text(desc)  // the task's additional information
                    .foregroundColor(.gray)
                Spacer()
                Image(systemName: isUrgent ? "exclamationmark.triangle.fill" : "exclamationmark.triangle")
            }
        }.padding()
    }
}

struct TaskDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailView(title: "Task", desc: "subhead")
    }
}
