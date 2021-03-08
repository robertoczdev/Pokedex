//
//  EvolutionsViewController.swift
//  pokedex
//
//  Created by admin on 3/5/21.
//

import UIKit

class EvolutionsViewController: BottomPopupViewController {
    
    //MARK: Outlets
    
    @IBOutlet weak var HideViewBtn: UIButton!
    @IBOutlet weak var pokemonNameLbl: UILabel!
    @IBOutlet weak var statsBtn: UIButton!
    @IBOutlet weak var evolutionsBtn: UIButton!
    @IBOutlet weak var movesBtn: UIButton!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var topView: UIView!
    
    
    //MARK: Variables
    var id:Int?
    var pokemonName:String?
    var mainColor:UIColor?
    
    var height: CGFloat?
    var topCornerRadius: CGFloat?
    var presentDuration: Double?
    var dismissDuration: Double?
    var shouldDismissInteractivelty: Bool?
    var text: String?
    
    //MARK: Properties
    
    // Bottom popup attribute variables
    // You can override the desired variable to change appearance
    
    override var popupHeight: CGFloat { return height ?? CGFloat(300) }
    
    override var popupTopCornerRadius: CGFloat { return topCornerRadius ?? CGFloat(10) }
    
    override var popupPresentDuration: Double { return presentDuration ?? 1.0 }
    
    override var popupDismissDuration: Double { return dismissDuration ?? 1.0 }
    
    override var popupShouldDismissInteractivelty: Bool { return shouldDismissInteractivelty ?? true }
    
    override var popupDimmingViewAlpha: CGFloat { return BottomPopupConstants.kDimmingViewDefaultAlphaValue }

    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        setUpData()
        setUpUI()
    }
    
    //MARK: Actions

    @IBAction func hideBtnAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func statsBtnAction(_ sender: Any) {
        self.movesBtn.backgroundColor = .white
        self.movesBtn.setTitleColor(self.mainColor, for: .normal)
        self.statsBtn.backgroundColor = self.mainColor
        self.statsBtn.setTitleColor(.white, for: .normal)
        self.evolutionsBtn.backgroundColor = .white
        self.evolutionsBtn.setTitleColor(self.mainColor, for: .normal)
        dismiss(animated: true, completion: nil)
    }
    @IBAction func evolutionsBtnAction(_ sender: Any) {
        
    }
    @IBAction func movesBtnAction(_ sender: Any) {
        self.movesBtn.backgroundColor = self.mainColor
        self.movesBtn.setTitleColor(.white, for: .normal)
        self.statsBtn.backgroundColor = .white
        self.statsBtn.setTitleColor(self.mainColor, for: .normal)
        self.evolutionsBtn.backgroundColor = .white
        self.evolutionsBtn.setTitleColor(self.mainColor, for: .normal)
        dismiss(animated: true, completion: nil)
        
    }
    
    
}

//MARK: set up UI methods
extension EvolutionsViewController{
    private func setUpUI(){
        statsBtn.layer.cornerRadius = 20
        evolutionsBtn.layer.cornerRadius = 20
        movesBtn.layer.cornerRadius = 20
        
        containerView.layer.cornerRadius = 45
        containerView.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMinXMinYCorner]
        containerView.backgroundColor = .white
        
        topView.backgroundColor = self.mainColor
        
        //evolutions btn selected
        self.movesBtn.backgroundColor = .white
        self.movesBtn.setTitleColor(self.mainColor, for: .normal)
        self.statsBtn.backgroundColor = .white
        self.statsBtn.setTitleColor(self.mainColor, for: .normal)
        self.evolutionsBtn.backgroundColor = self.mainColor
        self.evolutionsBtn.setTitleColor(.white, for: .normal)
        

    }
    
    func setUpData() {
        self.pokemonNameLbl.text = pokemonName
    }
}


