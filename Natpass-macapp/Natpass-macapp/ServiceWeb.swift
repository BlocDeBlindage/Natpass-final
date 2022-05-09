//
//  ServiceWeb.swift
//  Natpass_Mac
//
//  Created by nathael gravejat on 25/03/2022.
//

import Foundation

struct ModelDeReponse : Codable {
    var email : String
    var password : String
}


class ServiceWeb : ObservableObject
{
    @Published var resultat = Modele()
    let adresse : URL
    init() {
        guard let testUrl = URL(string: "http://172.16.21.32/natpass/connexionApp.php") else {
            print ("erreur URL !")
            fatalError("URL invalide")
        }
        adresse = testUrl
    }
    
     
    func RecupData (nomutilisateur : String, motdepasse : String)
    {
        print("la fonction est lancé")
        
        var requete = URLRequest(url: adresse)
        requete.httpMethod = "POST"
        requete.setValue("application/json", forHTTPHeaderField: "Accept")
        print("requete URL prête")
        let newObject = ModelDeReponse(email: nomutilisateur, password: motdepasse)
        let jsonData = try? JSONEncoder().encode(newObject)
        requete.httpBody = jsonData
        let task = URLSession.shared.dataTask(with: requete) { (data, _,error) in
            guard let data = data else {
                return
            }
            let decoder = JSONDecoder()
            print(String(data: data, encoding: .utf8)!)
            do {
                let decoded = try decoder.decode(Modele.self, from: data)
                self.resultat = decoded
                print(self.resultat.connexion)
                print("donnée décodé")
            }catch{
                print(error.localizedDescription)
                }
        }
        task.resume()
    }
    
}
