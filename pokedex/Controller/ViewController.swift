//
//  ViewController.swift
//  pokedex
//
//  Created by admin on 2/18/21.
//

import UIKit
import Alamofire
import Kingfisher
import PokemonAPI

class ViewController: UIViewController  {

    
    
    
    
    
    //MARK: Variables
    
    
    private let reusableCell:String = "pokemonCell"
    lazy var items: [Displayable] = []
    lazy var itemsCopy: [Displayable] = []
    var selectedItem: Displayable?
    var id:Int?
    

    //MARK: Outlets
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var SeparatorTop: UIView!
    @IBOutlet weak var separatorBottom: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var pokemonTableView: UITableView!
    
    //MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        
        activityIndicator.hidesWhenStopped = true
        activityIndicator.stopAnimating()
       
        //table view
        setUpData()
        
        searchBar.delegate = self
        pokemonTableView.dataSource = self
        pokemonTableView.delegate = self
        
        
        //MARK: Accesibility identifiers
        
        self.searchBar.accessibilityIdentifier = "searchBar"

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let gradientTop = UIColor.setGradient()
        gradientTop.frame = SeparatorTop.bounds
        self.SeparatorTop.layer.addSublayer(gradientTop)
        
        let gradientBottom = UIColor.setGradient()
        gradientBottom.frame = separatorBottom.bounds
        self.separatorBottom.layer.addSublayer(gradientBottom)
              
        super.viewWillAppear(animated)
    }
    
    //MARK: Actions
    
   
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchBar.text!.isEmpty ? self.items.count : self.itemsCopy.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reusableCell) as! PokemonCell
        //let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath)
        let item = searchBar.text!.isEmpty ? self.items[indexPath.row] : self.itemsCopy[indexPath.row]
        let id = Int(item.urlPokemon.deletingPrefix("https://pokeapi.co/api/v2/pokemon/").dropLast())
        cell.pokemonNameLbl?.text = item.nameLabelText
        let idFormated = String(format: "%03d", id!)
        cell.pokemonNumberLbl?.text = "#\(idFormated)"
        let imageURL = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(String(id!)).png")
        cell.pokemonImage.kf.setImage(with: imageURL)
        
        
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        self.id = searchBar.text!.isEmpty ? Int(items[indexPath.row].urlPokemon.deletingPrefix("https://pokeapi.co/api/v2/pokemon/").dropLast())! : Int(itemsCopy[indexPath.row].urlPokemon.deletingPrefix("https://pokeapi.co/api/v2/pokemon/").dropLast())!
        
        selectedItem = searchBar.text!.isEmpty ? items[indexPath.row] : itemsCopy[indexPath.row]
        
        
        return indexPath

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let popupVC = storyboard?.instantiateViewController(withIdentifier: "pokemonViewController") as? PokemonViewController else { return }
        popupVC.height = view.bounds.height
        popupVC.topCornerRadius = 0
        popupVC.presentDuration = 00.5
        popupVC.dismissDuration = 00.3
        //popupVC.shouldDismissInteractivelty = dismissInteractivelySwitch.isOn
        popupVC.popupDelegate = self
        popupVC.text = "seteando texto desde el primer VC"
        present(popupVC, animated: true, completion: nil)
        popupVC.data = selectedItem
        popupVC.idPokemon = self.id
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVC = segue.destination as? PokemonViewController else {
          return
        }
        destinationVC.data = selectedItem
        destinationVC.idPokemon = self.id
    }
    
    
    func createAlert() {
        // Create new Alert
        let dialogMessage = UIAlertController(title: "Confirm", message: "Are you sure you want to delete this?", preferredStyle: .alert)
        
        // Create OK button with action handler
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            
         })
        
        //Add OK button to a dialog message
        dialogMessage.addAction(ok)

        // Present Alert to
        self.present(dialogMessage, animated: true, completion: nil)
    }
    
    
    
    
}


extension ViewController{
    //MARK: Networking
    
    func setUpData(){
        NetworkingProvider.shared.getPokemons(url: "https://pokeapi.co/api/v2/", range: "pokemon?limit=1800") { (pokemon: [Pokemon]) in
            self.items = pokemon
            self.itemsCopy = pokemon
            print("items copy count\(self.itemsCopy.count)")
            self.tableView.reloadData()
        } failure: { (error: Error?) in
            print(error.debugDescription)
        }
       
    }
    
    
}

extension ViewController {
    
    
    
    func setupGradient(height: CGFloat,width: CGFloat,alpha: CGFloat) ->  CAGradientLayer {
        let gradient: CAGradientLayer = CAGradientLayer()
        let color0 =  UIColor(red: 110.0/255.0, green: 149.0/255.0, blue: 253.0/255.0, alpha: alpha).cgColor
        let color1 = UIColor(red: 111.0/255.0, green: 222.0/255.0, blue: 250.0/255.0, alpha: alpha).cgColor
        let color2 = UIColor(red: 141.0/255.0, green: 224.0/255.0, blue: 97.0/255.0, alpha: alpha).cgColor
        let color3 = UIColor(red: 81.0/255.0, green: 232.0/255.0, blue: 94.0/255.0, alpha: alpha).cgColor
        
        gradient.colors = [color0, color1, color2, color3]
        gradient.locations = [0.0, 0.36, 0.66, 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        
        
            gradient.frame = CGRect(x: 0.0, y: 0.0, width: width, height: height)
        
            return gradient
       }
    
    
    


}



extension ViewController:UISearchBarDelegate{
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let searchTerm = searchBar.text else {
            return
        }
        print(searchTerm)
        /*self.itemsCopy = self.items
        self.items = searchPokemon(text: searchTerm, items: self.itemsCopy)
        self.tableView.reloadData()
        self.items = self.itemsCopy
       */
        
        searchPokemon(text: searchTerm, items: self.items)
        self.pokemonTableView.reloadData()
    }
}


extension ViewController{
    func searchPokemon(text:String, items:[Displayable]) {
        var coincidences: [Displayable] = []
        
        /*for item in items {
            if item.nameLabelText.lowercased().contains(text.lowercased()) {
                coincidences.append(item)
                print(item.nameLabelText)
            }
        }*/

        coincidences = items.filter { $0.nameLabelText.lowercased().contains(text.lowercased())}
        print(coincidences.count)
        print("items copy count search pokemon\(coincidences.count)")
        
        self.itemsCopy = coincidences
        self.pokemonTableView.reloadData()
        
        //return coincidences
    
    }
}

//MARK: Bottom Pop up delegate
extension ViewController: BottomPopupDelegate{
    func bottomPopupViewLoaded() {
        print("bottomPopupViewLoaded")
    }
    
    func bottomPopupWillAppear() {
        print("bottomPopupWillAppear")
    }
    
    func bottomPopupDidAppear() {
        print("bottomPopupDidAppear")
    }
    
    func bottomPopupWillDismiss() {
        print("bottomPopupWillDismiss")
    }
    
    func bottomPopupDidDismiss() {
        print("bottomPopupDidDismiss")
    }
    
    func bottomPopupDismissInteractionPercentChanged(from oldValue: CGFloat, to newValue: CGFloat) {
        print("bottomPopupDismissInteractionPercentChanged fromValue: \(oldValue) to: \(newValue)")
    }
}

