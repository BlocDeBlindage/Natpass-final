//
//  CRAWL.swift
//  Natpass_Mac
//
//  Created by etudiant btssnir on 10/03/2022.
//
import SwiftUI

struct CRAWL: View {
    @ObservedObject var retourdatalecon = ServiceWeblecon()
    @ObservedObject var retourMots_Cle = ServiceWebMotCle()
    @Binding var choix: Int
    @Binding var video: String
    @Binding var text:String
    @Binding var titre:String
    @State  var search = ""
    @State var NageSelectionn√©: String = ""

    var body: some View {

        ZStack
            {
                ScrollView {
                VStack
                {
                    Text("R√©sultat de votre recherche : ")
                        .frame(width: 841, height: 71)
                        .offset(x: 44, y: 87)
    
                        
                     //afficher image de fond //
                        HStack{
                            VStack(alignment: .leading){
                    
                    Text("").onAppear(){
                        retourdatalecon.recupdatalecon(NageSelectionn√©: "crawl")
                    }
                    
                    ForEach (retourdatalecon.resultatlecon) { resultat in
                        
                        Divider()
                        Button(action:{self.choix = 7 ;self.video = resultat.lien_video; self.text = resultat.contenu_texte;self.titre = resultat.titre})
                        {
                        VStack{
                            HStack{
                                    AsyncImage(url:URL(string: resultat.image)){ image in
                                            image.resizable()
                                            .frame(width: 250, height: 200)
                                            .scaledToFill()
                                           
                                        } placeholder: {
                                            ProgressView()
                                            }
                               
                                    
                                
                            
                                        
                                VStack(alignment: .leading){
                                    
                                    Text(resultat.titre)
                                    .font(.largeTitle)
                                    .foregroundColor(Color(red: 49/255, green: 140/255, blue: 255/255, opacity:1))
                                    .padding()
                               
                                    Text(resultat.resume)
                                        .padding()
                                    
                              
                                    
                                    }
                                }
                            }
                        }.buttonStyle(PlainButtonStyle())
                    }
                }
                }
                }
            }
                Image("toolbar-img")
                     .offset(x: 0, y: -510)
                     HStack
                     {
                         Button(action: {self.choix = 2})
                         {
                             ZStack()
                             {
                         Image("LOGO")
                                 .resizable()
                                 .frame(width: 83.96, height: 51.97)
                             }
                         }.buttonStyle(PlainButtonStyle())
                             .frame(width: 83.96, height: 51.97)
                             .offset(x: -490, y: -510)
                         
                         HStack
                         {
                             CustomTextField(placeholder : Text("Recherchez une le√ßon").foregroundColor(Color(red: 58/255, green: 100/255, blue: 118/255, opacity:1)), text: $search)
                             .font(.system(size: 15))
                             .textFieldStyle(PlainTextFieldStyle()) // chang√© le style du text
                             .frame(width: 350, height: 0.5)
                             .padding()
                             
                             Button(action: { self.choix = 8
                                 Text("").onAppear(){
                                     retourMots_Cle.recupdatamots_cle(mots_cle_rechercher: search)
                                 }})
                             {
                                 Image(systemName: "magnifyingglass")
                             } .buttonStyle(PlainButtonStyle())
                                 .offset(x: -15)
                         }
                         .background(Capsule().fill(Color(red: 53/255, green: 54/255, blue: 62/255, opacity:1)))// couleur du fond
                         .offset(x: 150, y: -510)
                         
                         
                         
                         Button(action: { self.choix = 1})
                         {
                             HStack{
                      
                                 Text("D√©connexion")
                                         .font(.system(size: 30))
                                 
                                 Image("logo Utilisateur")
                                      .resizable()
                                      .frame(width: 40, height: 40 )
                                      
                                     
                             }
                                     }.cornerRadius(60)
                             .frame(width: 400, height: 60)
                             .buttonStyle(PlainButtonStyle())
                             .offset(x: 580, y: -510)
                             }
            }
    }
}
    



