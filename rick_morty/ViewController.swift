//
//  ViewController.swift
//  rick_morty
//
//  Created by COTEMIG on 27/06/23.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableview: UITableView!

    var listaPersonagens: [Personagem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
        
        AF.request("https://rickandmortyapi.com/api/character").responseDecodable(of: Response.self) { response in
            
            if let data = response.value {
                
                self.listaPersonagens = data.results
                
                self.tableview.reloadData()
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listaPersonagens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableview.dequeueReusableCell(withIdentifier: "personagemCell", for: indexPath) as? personagemCell {
            let personagem = listaPersonagens[indexPath.row]
            cell.setupCell(personagem: personagem)
            
            return cell
        } else {
            return UITableViewCell()
        }
    }
}

struct Response: Codable {
    let results: [Personagem]
}

struct Personagem: Codable {
    let name: String
    let species: String
    let image: String
}

