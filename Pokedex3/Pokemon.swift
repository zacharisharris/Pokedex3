//
//  Pokemon.swift
//  Pokedex3
//
//  Created by Harris Zacharis on 28/11/16.
//  Copyright © 2016 Harris Zacharis. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    
    private var _name : String!
    private var _pokedexID : Int!
    private var _description : String!
    private var _type : String!
    private var _defense : String!
    private var _height : String!
    private var _weight : String!
    private var _attack : String!
    private var _nextEvolutionText : String!
    private var _pokemonURL : String!
    
    var description: String {
        if _description == nil {
            _description = ""
        }
        return _description
    }
    
    var attack: String {
        if _attack == nil {
            _attack = ""
        }
        return _attack
    }
    
    var weight : String! {
        
        if _weight == nil {
            _weight = ""
        }
        return _weight
    }
    
    var height : String! {
        
        if _height == nil {
            _height = ""
        }
        return _height
    }
    
    var defense : String! {
        
        if _defense == nil {
            _defense = ""
        }
        return _defense
    }
    
    var type : String! {
        
        if _type == nil {
            _type = ""
        }
        return _type
    }
    
    var nextEvolutionText : String! {
        
        if _nextEvolutionText == nil {
            _nextEvolutionText = ""
        }
        return _nextEvolutionText
    }
    
    
    var name: String {
        return _name
    }
    
    var pokedexID : Int {
        
        return _pokedexID
    }
    
    
    
    init(name: String, pokedexID : Int) {
        
        self._name = name
        self._pokedexID = pokedexID
        
        self._pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(self.pokedexID)/"
    }
    
    
    func downloadPokemonDetails(completed: DownloadComplete) {
        //Alamofire download
        Alamofire.request(_pokemonURL).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let weight = dict["weight"] as? String {
                    
                    self._weight = weight
                }
                
                if let height = dict["height"] as? String {
                    
                    self._height = height
                }
                
                if let attack = dict["attack"] as? Int {
                    
                    self._attack = "\(attack)"
                }
                
                if let defense = dict["defense"] as? Int {
                    
                    self._defense = "\(defense)"
                }
                
                if let types = dict["types"] as? [Dictionary<String, String>] , types.count > 0 {
                    if types.count == 1 {
                        if let name = types[0]["name"] {
                            self._type = name.capitalized
                        }
                    }
                    
                    if types.count == 2 {
                        
                        if let name = types[0]["name"] {
                            self._type = name.capitalized
                        }
                        
                        if let secondType = types[1]["name"] {
                            self._type! += "/\(secondType.capitalized)"
                        }
                    }
                
                    }
                }
            
        }
        
    completed()
        
    }
    
}

