//
//  ViewController.swift
//  pokedex
//
//  Created by admin on 2/18/21.
//

import UIKit
import Alamofire
import Kingfisher

class ViewController: UIViewController  {

    //MARK: Variables
    
    
    private let reusableCell:String = "pokemonCell"
    lazy var items: [Displayable] = []
    lazy var itemsCopy: [Displayable] = []
    var pokemon = [Pokemon]()
    var selectedItem: Displayable?
    var id:Int?
    typealias DataSource = UITableViewDiffableDataSource<Section,Pokemon>
    private lazy var dataSource = makeDataSource()
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section,Pokemon>
    enum Section {
      case main
    }

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
        activityIndicator.hidesWhenStopped = true
        activityIndicator.stopAnimating()
        setUpData()
        searchBar.delegate = self
        pokemonTableView.delegate = self
        //MARK: Accesibility identifiers
        
        self.searchBar.accessibilityIdentifier = "searchBar"

        
    }
    
    func makeDataSource() -> DataSource {
        let datasource = DataSource(tableView: tableView, cellProvider: { (tableView, indexPath, pokemon) -> UITableViewCell? in
            let cell = tableView.dequeueReusableCell(withIdentifier: self.reusableCell,for: indexPath) as? PokemonCell
            let id = Int(pokemon.urlPokemon.deletingPrefix("https://pokeapi.co/api/v2/pokemon/").dropLast())
            cell?.pokemonNameLbl?.text = pokemon.name
            let idFormated = String(format: "%03d", id!)
            cell?.pokemonNumberLbl?.text = "#\(idFormated)"
            let imageURL = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(String(id!)).png")
            cell?.pokemonImage.kf.setImage(with: imageURL)
            return cell
        })
        return datasource
    }
    
    // 1
    func applySnapshot(items: [Pokemon], animatingDifferences: Bool = false) {
      // 2
      var snapshot = Snapshot()
      // 3
      snapshot.appendSections([.main])
      // 4
      snapshot.appendItems(items)
      // 5
      dataSource.apply(snapshot, animatingDifferences: animatingDifferences)
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

extension ViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
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
        guard let id = id else { return }
        popupVC.idPokemon = id
        popupVC.setUpDataPokemon(idPokemon: id)

        present(popupVC, animated: true, completion: nil)



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
        NetworkingProvider.shared.getPokemons(url: "https://pokeapi.co/api/v2/", range: "pokemon?limit=10") { (pokemon: [Pokemon]) in
            self.items = pokemon
            self.pokemon = pokemon
            self.itemsCopy = pokemon
            self.applySnapshot(items: self.pokemon)
            print("items copy count\(self.itemsCopy.count)")
            
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
        var coincidences: [Pokemon] = []
        coincidences = pokemon.filter { $0.nameLabelText.lowercased().contains(text.lowercased())}
        print(coincidences.count)
        print("items copy count search pokemon\(coincidences.count)")
        text == "" ? applySnapshot(items: pokemon) : applySnapshot(items: coincidences, animatingDifferences: true)
        
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

