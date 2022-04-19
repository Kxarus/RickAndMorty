//
//  TableViewCell.swift
//  TableViewCell
//
//  Created by Roman Kiruxin on 18.04.2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var avatarCharacter: UIImageView!
    @IBOutlet weak var nameCharacter: UILabel!
    @IBOutlet weak var speciesCharacter: UILabel!
    @IBOutlet weak var genderCharacter: UILabel!
    
    var characterDetail = RMCharacter(name: "", status: "", species: "", gender: "", location: RMLocation(name: "", url: ""), image: "", episode: [])
    
    func configure(dataCharacter: RMCharacter) {
        characterDetail = dataCharacter
        
        DispatchQueue.global().async {
            guard let imageUrl = URL(string: self.characterDetail.image) else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }

            DispatchQueue.main.async {
                self.avatarCharacter.image = UIImage(data: imageData)
            }
        }
        
        nameCharacter.text = characterDetail.name
        speciesCharacter.text = characterDetail.species
        genderCharacter.text = characterDetail.gender
        
        avatarCharacter.layer.cornerRadius = 32.5
    }
}
