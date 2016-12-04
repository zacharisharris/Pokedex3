//
//  PokemonDetailVC.swift
//  Pokedex3
//
//  Created by Harris Zacharis on 4/12/16.
//  Copyright © 2016 Harris Zacharis. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    var pokemon: Pokemon!

    @IBOutlet weak var nameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = pokemon.name
    }

}
