//
//  ContentModel.swift
//  LearningApp
//
//  Created by Eric Chandonnet on 2022-11-25.
//

import Foundation

class ContentModel: ObservableObject {
    
    @Published var modules = [Module]()
    
    var styleData: Data?
    
    init () {
        
        getLocalData()
    }
    
    func getLocalData() {
        
        // Aller chercher un url au fichier json
        let jsonUrl = Bundle.main.url(forResource: "data", withExtension: "json")
        
        
        do {
            // Lire le fichier dans un data object
            let jsonData = try Data(contentsOf: jsonUrl!)
            
            // Essayer de décoder l'object
            let jsonDecoder = JSONDecoder()
            let modules = try jsonDecoder.decode([Module].self, from: jsonData)
            
            // Assigner ces modules parsés à ContentModel comme propriété @Published
            self.modules = modules
        }
        catch {
            // Catch l'erreur
            print("Couldn't parse local json data.")
        }

        // Aller chercher un url au fichier json
        let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        
        
        do {
            // Lire le fichier dans un data object
            let styleData = try Data(contentsOf: styleUrl!)
            
            // Assigner ces modules parsés à ContentModel comme propriété @Published
            self.styleData = styleData
        }
        catch {
            // Catch l'erreur
            print("Couldn't parse local style data.")
        }

        
    }
}
