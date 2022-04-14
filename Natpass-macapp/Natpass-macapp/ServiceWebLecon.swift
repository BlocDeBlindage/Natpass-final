//
//  ServiceWebLecon.swift
//  Natpass_Mac
//
//  Created by etudiant btssnir on 01/04/2022.
//

import Foundation

struct ToDoResponseModel: Codable {
    var categorie : String
}

class ServiceWeblecon : ObservableObject {
    @Published var resultatlecon : [ModeleLecon] = []
    let adresselecon : URL
    init() {
        
        guard let testUrllecon = URL(string: "http://172.16.21.32/natpass/categorie.php") else {
            print ("URL error!")
            fatalError("Invalid URL")
        }
        adresselecon = testUrllecon

                }
    
    func recupdatalecon (NageSelectionné : String) {

        print("la fonction des leçons est lancé")
        // Prepare URL Request Object
        var requetelecon = URLRequest(url: adresselecon)
        requetelecon.httpMethod = "POST"
        requetelecon.setValue("application/json", forHTTPHeaderField: "Accept")
        print("requete URLlecon prête")
        let newTodoItem = ToDoResponseModel(categorie: NageSelectionné)
        // Set HTTP Request Body
        let jsonData = try? JSONEncoder().encode(newTodoItem)
        requetelecon.httpBody = jsonData
        let tache = URLSession.shared.dataTask(with: requetelecon) { (data, _, error) in
            guard let data = data else {
                    
                    return
            }
            let decoder = JSONDecoder()
            print(String(data: data, encoding: .utf8)!)
            do {
                let decoded = try decoder.decode([ModeleLecon].self, from: data)
                self.resultatlecon = decoded

                print("donnée décodé")
            }catch{
                print(error.localizedDescription)
            }
        }

        tache.resume()
    }
}
