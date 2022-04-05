//
//  ContentView.swift
//  testMac
//
//  Created by nathael gravejat on 03/02/2022.
//


import Foundation

class ModeleLecon: Codable, Identifiable
{
    var titre : String
    var lien_video : String
    var image : String
    var contenu_texte : String
    var resume : String
    init(){
        titre = "no titre"
        lien_video = "no video"
        image = "no image"
        contenu_texte = "no contenu_texte"
        resume = "no resume"
    }
}
