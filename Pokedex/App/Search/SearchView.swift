//
//  SearchView.swift
//  Pokedex
//
//  Created by Victor Ulloa on 2024-03-30.
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject var viewModel: SearchViewModel = SearchViewModel()
    @State private var searchText = ""
    
    var searchResults: [PokemonListItem] {
        if searchText.isEmpty {
            return viewModel.pokemonListItems
        } else {
            return viewModel.pokemonListItems.filter { $0.name.contains(searchText.lowercased()) }
        }
    }
    
    var body: some View {
        NavigationView {
            
            VStack {
                HStack {
                    TextField("Search", text: $searchText)
                        .onReceive(searchText.publisher, perform: { text in
                            print(text)
                        })
                        .textFieldStyle(.roundedBorder)
                    
                    Button {
                        searchText = ""
                    } label: {
                        Text("Cancel")
                    }
                }
                .padding()
                    

                
                List {
                    ForEach(searchResults) { item in
                        NavigationLink {
                            Text(item.name.capitalized)
                        } label: {
                            Text(item.name.capitalized)
                        }
                    }
                }
                .listStyle(.plain)
                
            }
            .navigationTitle("Pokemon List")
        }
        .navigationViewStyle(.stack)
    }
}

#Preview {
    SearchView()
}
