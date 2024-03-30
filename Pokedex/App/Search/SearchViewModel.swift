//
//  SearchViewModel.swift
//  Pokedex
//
//  Created by Victor Ulloa on 2024-03-30.
//

import Combine

final class SearchViewModel: ObservableObject {
    
    @Published var index: Int = 0
    @Published var pokemonListResponse : PokemonListResponse?
    
    private var cancellable: AnyCancellable?
    
    init() {
        
        cancellable = $index.sink { value in
            NetworkManager.instance.getPokemonList(offset: 0, limit: 20) { response in
                print(response)
            }
        }
        
    }
    
}
