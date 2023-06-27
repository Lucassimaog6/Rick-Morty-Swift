//
//  personagemCell.swift
//  rick_morty
//
//  Created by COTEMIG on 27/06/23.
//

import UIKit
import Kingfisher

class personagemCell: UITableViewCell {
    
    @IBOutlet weak var imagem: UIImageView!
    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var subititulo: UILabel!
    
    func setupCell(personagem: Personagem) {
        titulo.text = personagem.name
        subititulo.text = personagem.species
        imagem.kf.setImage(with: URL(string: personagem.image)!)
        imagem.layer.cornerRadius = imagem.frame.width/2
        imagem.layer.borderWidth = 1
        imagem.layer.borderColor = UIColor.black.cgColor
        backgroundColor = UIColor.lightGray
    }
}
