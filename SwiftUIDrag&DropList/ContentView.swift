//
//  ContentView.swift
//  SwiftUIDrag&DropList
//
//  Created by Ramill Ibragimov on 26.03.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        UITableView.appearance().tableFooterView = UIView()
        UITableView.appearance().separatorStyle = .none
    }
    
    @State var recipeSteps = [
        "One",
        "Two",
        "Three",
        "Four",
        "Five"
    ]
    
    @State var editingList = false
    
    var body: some View {
        List {
            ForEach(0..<recipeSteps.count) { i in
                Text("\(i): \(self.recipeSteps[i])")
                    .padding(EdgeInsets.init(top: 3, leading: 6, bottom: 3, trailing: 6))
                    .background(Color.init(red: 0.9, green: 0.9, blue: 0.9))
                    .cornerRadius(5)
                    .lineLimit(nil)
            }
            .onMove(perform: move)
            .onLongPressGesture {
                withAnimation {
                    self.editingList = true
                }
            }
        }.environment(\.editMode, editingList ? .constant(.active) : .constant(.inactive))
    }
    
    func move(fromOffsets source: IndexSet, toOffsets destination: Int) {
        recipeSteps.move(fromOffsets: source, toOffset: destination)
        withAnimation {
            editingList = false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
