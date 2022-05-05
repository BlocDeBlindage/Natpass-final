//
//  ContentView.swift
//  testMac
//
//  Created by nathael gravejat on 03/02/2022.
//


import SwiftUI
import StackNavigationView

extension NSTextField {
    open override var focusRingType: NSFocusRingType {
        get { .none }
        set { }
    }
}
//fonction pour l'oeil d'affichage du mdp //

struct SecureInputView: View { // utilisation SecureInputView("",text: $text)
    
    @Binding private var text: String
    @State private var isSecured: Bool = true
    private var title: String
    
    init(_ title: String, text: Binding<String>) {
        self.title = title
        self._text = text
    }
    
    var body: some View {
        ZStack(alignment: .trailing) {
            if isSecured {
                SecureField(title, text: $text)
            } else {
                TextField(title, text: $text)
            }
            Button(action: {isSecured.toggle()})
            {
                Image(systemName: "eye")
                    .accentColor(.white)
            }.buttonStyle(PlainButtonStyle())
        }
    }
}
//fonction pour l'oeil d'affichage du mdp //


struct CustomTextField: View { // modification du textfield pour pouvoir changé la couleur du text par defaut
    var placeholder: Text
    @Binding var text : String
    var editingChanged: (Bool)->() = { _ in}
    var comint: ()->() = {  }
   
    var body: some View {
        ZStack{
            if text.isEmpty {placeholder}
            TextField("",text: $text, onEditingChanged: editingChanged, onCommit: comint)
             //utilisation CustomTextField(placeholder : Text("").foregroundColor(.white), text: $nomvariable )
        }
    }
}

struct CustomsecureField: View { //identique a la fonction customeTextField mais pour securefied
    var placeholder: Text
    @Binding var text : String
    var editingChanged: (Bool)->() = { _ in}
    var comint: ()->() = {  }
   
    var body: some View {
        ZStack{
            if text.isEmpty {placeholder}
            SecureInputView("",text: $text)
            // utilisation CustomsecureField(placeholder : Text("mot de passe").foregroundColor(.white), text: $motdepasse)
        }
    }
}

struct ContentView: View {
//    @ObservedObject var retourData = ServiceWeb()
    @State private var choix = 1
    @State private var video = ""
    @State private var text = ""
    @State private var titre = ""
    @State private var search = ""
    var body: some View {
        VStack{
            switch(choix)
            {
           
            case 2 :
                Acceuil(choix: $choix, search: $search)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color(red: 53/255, green: 54/255, blue: 62/255, opacity:1))
                    .transition(AnyTransition.move(edge: .trailing)).animation(.default)
                
            
            case 3 :
                CRAWL(choix: $choix,video:$video,text: $text,titre:$titre)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color(red: 53/255, green: 54/255, blue: 62/255, opacity:1))
                
                
            
            case 4 :
                BRASSE(choix: $choix,video:$video,text: $text,titre:$titre)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color(red: 53/255, green: 54/255, blue: 62/255, opacity:1))
                  //  .transition(AnyTransition.move(edge: .trailing)).animation(.default)
                
            
            case 5 :
                PAPILLON(choix: $choix,video:$video,text: $text,titre:$titre)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color(red: 53/255, green: 54/255, blue: 62/255, opacity:1))
                 //   .transition(AnyTransition.move(edge: .trailing)).animation(.default)
                
            
            case 6 :
                DOS(choix: $choix,video:$video,text: $text,titre:$titre)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color(red: 53/255, green: 54/255, blue: 62/255, opacity:1))
                  //  .transition(AnyTransition.move(edge: .trailing)).animation(.default)
   
            case 7 :
                lecteur_video(choix:$choix,video:$video,text: $text,titre:$titre)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color(red: 53/255, green: 54/255, blue: 62/255, opacity:1))
                   // .transition(AnyTransition.move(edge: .trailing)).animation(.default)
   
            case 8:
                Resultat_Recherche(choix: $choix,search: $search,video:$video,text: $text,titre:$titre)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color(red: 53/255, green: 54/255, blue: 62/255, opacity:1))
                    //.transition(AnyTransition.move(edge: .trailing)).animation(.default)
                
            default :
                connexion(choix: $choix)
                    .frame(maxWidth: 1920, maxHeight: 1080)
                    .background(Color(red: 53/255, green: 54/255, blue: 62/255, opacity:1))
                    .transition(AnyTransition.move(edge: .leading)).animation(.default)

            }
            
        }
    }
}


struct connexion: View {
    @ObservedObject var retourData = ServiceWeb()
    @State var nomutilisateur: String = "" //variable pour text du login utilisateur
    @State var motdepasse: String = ""   //variable pour text du login mot de passe
    @Binding var choix: Int
    @State var click = false
    @State var erreur = false

  
    var body: some View {
       
        //afficher image de fond //
        ZStack{
            Image("img-fond")
            
        //afficher image de fond //
            VStack{   //aligné verticalement img fond avec logo
                HStack{ //aligné horizontalement logo  avec natpass
                    Image("LOGO") //image utilisé depuis assets
                    Image("NATPASS") //idem
                      }
                Spacer() // espace entre le Vstack contenant les images et le Zstack qui contien tout les parametre de connexion
                    .frame(height: 100) // taille de l'espacement
                    
                ZStack {          //aligné en profondeur rectangle avec les different case de login
                    Rectangle()
                    //dégradé de couleur//
                        .fill(LinearGradient(colors: [Color(red: 0.0, green: 10/255, blue: 46/255, opacity:0.9), Color(red: 78/255, green: 98/255, blue: 169/255, opacity: 0.9)], startPoint: .topLeading, endPoint: .bottomTrailing))
                        //dégradé de couleur//
                            .cornerRadius(60) //angle de la fenetre
                            .frame(width: 1155, height: 650.0) // taille du rectangle
                    VStack{
                        //partie utilisateur du login //
                        ZStack {
                            HStack{
                                Image(systemName: "person") // image de connexion, utilisation des images systeme
                                    .resizable()
                                    .frame(width: 20, height: 20 )
                                    .scaledToFill()
                                
                                CustomTextField(placeholder : Text("nom d'utilisateur").foregroundColor(.white), text: $nomutilisateur )
                                    .font(.system(size: 20))
                                    .textFieldStyle(PlainTextFieldStyle()) // changé le style du text
                                    .frame(width: 1000, height: 17.5)
                                    .background(Color(red: 55/255, green: 66/255, blue: 114/255, opacity:1)) // couleur du fond
                                    .padding()
                                }.padding()
                                .background(Capsule().fill(Color(red: 55/255, green: 66/255, blue: 114/255, opacity:1)))
                            //partie utilisateur du login //

                            
                            Spacer()
                                .frame(height: 200)
                                }
                        //partie mot de passe du login //

                        ZStack {
                            HStack{
                                Image(systemName: "lock")
                                    .resizable()
                                    .frame(width: 20, height: 20 ) //taille image
                                    .scaledToFill()
                        
                                CustomsecureField(placeholder : Text("mot de passe").foregroundColor(.white), text: $motdepasse)
                                    .font(.system(size: 20))
                                    .textFieldStyle(PlainTextFieldStyle())
                                    .frame(width: 1000, height: 17.5) // taille de la saisie de text
                                    .background(Color(red: 55/255, green: 66/255, blue: 114/255, opacity:1))
                                    .padding()
                                    }
                                }.padding()
                            .background(Capsule().fill(Color(red: 55/255, green: 66/255, blue: 114/255, opacity:1)))
                        
                        //partie mot de passe du login //

                        Spacer()
                            .frame(height: 100)
                        
                        
                        Button(action: { self.click = true
                            retourData.RecupData(nomutilisateur: nomutilisateur, motdepasse: motdepasse)
                            usleep(600000)
                        })
                        {

                            if click {
                            if retourData.resultat.connexion{
                                Text("").onAppear(){
                                choix = 2 }
                            }
                            
                            else {Text("").onAppear(){erreur = true}}
                                
                            }
                            HStack{
                               Image("icone_connexion")
                                    .resizable()
                                    .frame(width: 80, height: 80 )
                                    .offset(x: 20)
                                
                                Spacer()
                                    
                                Text("se connecter")
                                        .font(.system(size: 30))
                                        .offset(x: -80)
                            }
                                    }.cornerRadius(60)
                            .frame(width: 400, height: 60)
                            .background(Capsule().fill(Color(red: 55/255, green: 66/255, blue: 114/255, opacity:1)))
                            .buttonStyle(PlainButtonStyle())
                       
                        if erreur {
                            
                            Text("mauvais email ou mot de passe entré ").foregroundColor(.red)
                        }
                                
                            
                        } //alignement vertical de tout les saisie de text plus le bouton
                    } // fin de l'alignement en profondeur pour la partie connexion
                } // fin de l'alignement du Vstak qui aligne tout
            } // fin du Zstack pour l'image de fond
    } // fin body
} //fin content

