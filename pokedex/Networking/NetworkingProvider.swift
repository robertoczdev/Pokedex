//
//  NetworkingProvider.swift
//  pokedex
//
//  Created by admin on 2/19/21.
//

import Foundation
import Alamofire

final class NetworkingProvider{
    
    
    
    static let shared = NetworkingProvider()
    
    private let KStatusOK = 200...299
    var pokemons: [Pokemon] = []
    var items: [Displayable] = []
    
    
    
    func getPokemons(url:String,range:String, success: @escaping (_ pokemon: [Pokemon])->(), failure: @escaping (_ error: Error?) ->() ){
        let url = "\(url)\(range)"
        AF.request(url, method: .get).validate(statusCode: KStatusOK).responseDecodable(of: Pokemons.self ){
            response in
            if let pokemon = response.value{
                
                success(pokemon.all!)
            }else{
                failure(response.error)
            }
            
        }
    }
    
    
    func getPokemonData(url:String,success: @escaping (_ poke:PokemonBase)->(), failure: @escaping (_ error: Error?) ->() ){
        let url = "\(url)"
        AF.request(url, method: .get).validate(statusCode: KStatusOK).responseDecodable(of: PokemonBase.self ){
            response in
            if let pokemon = response.value{
                print(pokemon.types![0].type?.name ?? "nill")
                success(pokemon)
            }else{
                failure(response.error)
            }
            
        }
    }
    
    func getPokemonSpecies(url:String,success: @escaping (_ species:SpeciesBase)->(), failure: @escaping (_ error: Error?) ->() ){
        let url = "\(url)"
        AF.request(url, method: .get).validate(statusCode: KStatusOK).responseDecodable(of: SpeciesBase.self ){
            response in
            if let pokemon = response.value{
                print(pokemon.flavorTextEntries?[7].flavorText ?? "nill")
                success(pokemon)
            }else{
                failure(response.error)
            }
            
        }
    }
    
  
    
}

