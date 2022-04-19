//
//  DetailViewController.swift
//  DetailViewController
//
//  Created by Roman Kiruxin on 18.04.2022.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var nameCharacter: UILabel!
    @IBOutlet weak var speciesCharacter: UILabel!
    @IBOutlet weak var genderCharacter: UILabel!
    @IBOutlet weak var statusCharacter: UILabel!
    @IBOutlet weak var locationCharacter: UILabel!
    @IBOutlet weak var numberOfEpisodes: UILabel!
    @IBOutlet weak var imageCharacter: UIImageView!
    
    var characterDetail = RMCharacter(name: "", status: "", species: "", gender: "", location: RMLocation(name: "", url: ""), image: "", episode: [])
    
    var avatarCharacter: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageCharacter.layer.cornerRadius = 100
        configure()
    }
    
    func configure() {
        nameCharacter.text = characterDetail.name
        speciesCharacter.text = characterDetail.species
        genderCharacter.text = characterDetail.gender
        statusCharacter.text = characterDetail.status
        locationCharacter.text = characterDetail.location.name
        numberOfEpisodes.text = String(characterDetail.episode.count)
        imageCharacter.image = avatarCharacter
    }

}
