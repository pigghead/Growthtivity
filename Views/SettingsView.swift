//
//  SettingsView.swift
//  Growthtivity
//
//  Created by Justin Armstrong on 11/26/19.
//  Copyright © 2019 Justin Armstrong. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack {
            Text("This is the settings page. I am not sure what I would like to add here just yet.")
                .padding()
            
            Image(systemName: "exclamationmark.triangle")
                .font(.largeTitle)
                .foregroundColor(.red)
        }
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
