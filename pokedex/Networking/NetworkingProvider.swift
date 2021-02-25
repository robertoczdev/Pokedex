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
    private let imageURL:String = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png"
    private let KUrl = ""
    private let KStatusOK = 200...299
    private let KRange = "pokemon/"
    var pokemons: [Pokemon] = []
    var items: [Displayable] = []
    
    func fetchPokemons(){
      AF.request("\(KUrl)\(KRange)").validate().responseDecodable(of: Pokemons.self) { (response) in
        guard let pokemons = response.value else { return }
        self.pokemons = pokemons.all!
        self.items = pokemons.all!
        //self.tableView.reloadData()
        print(pokemons.all![5].name!)
        print(self.items)
        
      }
        
    }
    
    
    func getPokemons(url:String,range:String, success: @escaping (_ pokemon: [Pokemon])->(), failure: @escaping (_ error: Error?) ->() ){
        let url = "\(url)\(range)"
        AF.request(url, method: .get).validate(statusCode: KStatusOK).responseDecodable(of: Pokemons.self ){
            response in
            if let pokemon = response.value{
                print(pokemon.all!)
                success(pokemon.all!)
            }else{
                failure(response.error)
            }
            
        }
    }
    
    
    func getPokemonDetail(url:String,success: @escaping (_ poke: Sprites)->(), failure: @escaping (_ error: Error?) ->() ){
        let url = "\(url)"
        AF.request(url, method: .get).validate(statusCode: KStatusOK).responseDecodable(of: PokemonBase.self ){
            response in
            if let pokemon = response.value{
                print(pokemon.sprites?.backDefault!)
                success(pokemon.sprites!)
            }else{
                failure(response.error)
            }
            
        }
    }
    
    func getPokemonTypes(url:String,success: @escaping (_ poke:PokemonBase)->(), failure: @escaping (_ error: Error?) ->() ){
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
    
    /*func downloadJSON(completed: @escaping () ->()){
        let url = URL(string : "https://pokeapi.co/api/v2/pokemon?limit=100&offset=200")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error == nil{
                do{
                    self.pokemons = try JSONDecoder().decode([PokemonResponse].self, from: data!)
                    DispatchQueue.main.async {
                        completed()
                    }
                    
                }catch{
                    print("json errror")
                }
            }
        }.resume()
        
    }*/
    
    
}

