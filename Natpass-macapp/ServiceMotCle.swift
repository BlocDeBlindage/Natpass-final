//
//  ServiceMotCle.swift
//  Natpass-macapp
//
//  Created by etudiant btssnir on 05/05/2022.
//


import Foundation

struct Modelreponsemotcle: Codable {
    var mots_cle : String
}

class ServiceWebMotCle : ObservableObject {
    @Published var resultatmots_cle : [ModeleLecon] = []
    let adressemotcle : URL
    init() {
        
        guard let testUrlmotcle = URL(string: "http://172.16.21.32/natpass/mots_cle.php") else {
            print ("URL error!")
            fatalError("Invalid URL")
        }
        adressemotcle = testUrlmotcle

                }
    
    func recupdatamots_cle (mots_cle_rechercher : String) {

        print("la fonction des leçons est lancé")
        // Prepare URL Request Object
        var requetemotcle = URLRequest(url: adressemotcle)
        requetemotcle.httpMethod = "POST"
        requetemotcle.setValue("application/json", forHTTPHeaderField: "Accept")
        print("requete URLlecon prête")
        let nouvelletache = Modelreponsemotcle(mots_cle: mots_cle_rechercher)
        // Set HTTP Request Body
        let jsonData = try? JSONEncoder().encode(nouvelletache)
        requetemotcle.httpBody = jsonData
        let tache = URLSession.shared.dataTask(with: requetemotcle) { (data, _, error) in
            guard let data = data else {
                    
                    return
            }
            let decoder = JSONDecoder()
            print(String(data: data, encoding: .utf8)!)
            do {
                let decoded = try decoder.decode([ModeleLecon].self, from: data)
                self.resultatmots_cle = decoded

                print("donnée décodé")
            }catch{
                print(error.localizedDescription)
            }
        }

        tache.resume()
    }
}
