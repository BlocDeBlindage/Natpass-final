//
//  Acceuil.swift
//  Natpass_Mac
//
//  Created by nathael gravejat on 04/03/2022.
//

import SwiftUI

struct Acceuil: View {
    @ObservedObject var retourMots_Cle = ServiceWebMotCle()
    @Binding var choix: Int
    @Binding  var search : String


    var body: some View {
       
        ZStack{
            Rectangle()
                .fill(Color(red: 53/255, green: 54/255, blue: 62/255, opacity:1))
                .frame(width:800, height: 600)
            ZStack
                {
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
                                 CustomTextField(placeholder : Text("Recherchez une leçon").foregroundColor(Color(red: 58/255, green: 100/255, blue: 118/255, opacity:1)), text: $search)
                                 .font(.system(size: 15))
                                 .textFieldStyle(PlainTextFieldStyle()) // changé le style du text
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
                          
                                     Text("Déconnexion")
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
                
                    VStack
                    {
                        Text("Recherchez une leçon ou choisissez une des catégories ci dessous")
                            .font(.system(size: 36))
                        
                        Spacer()
                            .frame(height: 100)
                        
                        HStack{
                            
                            Button(action: { self.choix = 3})
                                {
                                    Image("CRAWL")
                                        .resizable()
                                }
                                .buttonStyle(PlainButtonStyle())
                                .frame(width: 613, height: 225)
                            
                            Spacer()
                                .frame(width: 500)
                            
                            Button(action: { self.choix = 4})
                            {
                                Image("BRASSE")
                                    .resizable()
                            }
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: 613, height: 225)
                            
                            }
                        
                        
                        Spacer()
                            .frame(height: 100)
//
                        HStack{
                            
                            Button(action: { self.choix = 5})
                            {
                            Image("PAPILLON")
                                    .resizable()
                            }
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: 613, height: 225)
                            
                            Spacer()
                                .frame(width: 500)
                            
                            Button(action: { self.choix = 6})
                            {
                            Image("DOS")
                                    .resizable()
                            }
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: 613, height: 225)
                            }
                    }
                        }
                    
                    }
                 
                }
}
                    

    
   
        
    
