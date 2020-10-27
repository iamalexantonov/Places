//
//  ContentView.swift
//  Places
//
//  Created by Alexey Antonov on 26/10/2020.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    @ObservedObject private var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            TextField("Search places...", text: $searchText)
            List(viewModel.locations.filter { $0.title.hasPrefix(searchText) }) { place in
                PlaceRow(place: place)
            }
        }.padding()
    }
}

struct PlaceRow: View {
    var place: Location
    
    var body: some View {
        HStack {
            Text("\(place.title)")
            Spacer()
            if place.distance != nil {
                Image(systemName: "location.fill").foregroundColor(.secondary)
                Text("\(place.distance ?? 0, specifier: "%.2f") km").foregroundColor(.secondary)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
