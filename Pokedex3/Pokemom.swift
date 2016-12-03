//
//  Pokemom.swift
//  Pokedex3
//
//  Created by Harris Zacharis on 28/11/16.
//  Copyright © 2016 Harris Zacharis. All rights reserved.
//

import Foundation

class Pokemon {
    
    private var _name : String!
    private var _pokedexID : Int!
    
    var name: String {
        return _name
    }
    
    var pokedexID : Int {
        
        return _pokedexID
    }
    
    init(name: String, pokedexID : Int) {
        
        self._name = name
        self._pokedexID = pokedexID
    }
    
    
    
    
}
