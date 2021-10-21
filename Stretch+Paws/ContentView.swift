//
//  ContentView.swift
//  Stretch+Paws
//
//  Created by Louise Bishop 21/09/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      NavigationView {
        List {
          Text("Downward-facing Dog")
          Text("Standing Forward Fold")
          Text("Tree Pose")
        }.listStyle(.grouped)
      .navigationBarTitle("Stretch + Paws")
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
