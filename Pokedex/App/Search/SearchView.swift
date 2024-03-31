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
        NavigationStack {
            List {
                ForEach(searchResults, id: \.name) { item in
                    NavigationLink {
                        Text(item.name)
                    } label: {
                        Text(item.name)
                    }
                }
            }
            .navigationTitle("Pokemons")
        }
        .searchable(text: $searchText)
    }
}

#Preview {
    SearchView()
}
