//
//  TableViewController.swift
//  TableViewController
//
//  Created by Roman Kiruxin on 18.04.2022.
//

import UIKit

class TableViewController: UITableViewController {
    
    @IBOutlet var tableview: UITableView!
    
    var dataCharacter = RMCharacterInfoModel(info: Info(pages: 0), results: [])

    override func viewDidLoad() {
        super.viewDidLoad()
       
        NetworkManager.fetchData { dataCharacter in
            self.dataCharacter = dataCharacter
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataCharacter.results.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell

        cell.configure(dataCharacter: dataCharacter.results[indexPath.row])
        
        if (indexPath.row == (dataCharacter.results.count - 1)) {
            
            if NetworkManager.page != dataCharacter.info.pages {
                NetworkManager.page += 1
                NetworkManager.fetchData { dataCharacter in
                    self.dataCharacter.results += dataCharacter.results
                    tableView.reloadData()
                }
            }
            
        }
        
        return cell
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detail" {
            guard let detailVC = segue.destination as? DetailViewController else { return }
            guard let cell = sender as? TableViewCell else { return }
            
            detailVC.characterDetail = cell.characterDetail
            detailVC.avatarCharacter = cell.avatarCharacter.image
        }
    }

}
