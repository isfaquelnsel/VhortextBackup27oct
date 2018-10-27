//
//  FavoriteTabVC.swift
//  Vhortext
//
//  Created by LNSEL on 13/09/18.
//  Copyright © 2018 lnsel. All rights reserved.
//

import UIKit

class FavoriteTabVC: UIViewController {
    
    /*MARK:--------------------------UI Design(start)-----------------------------*/
    @IBOutlet weak var favoriteTableView: UITableView!
    
    var favoriteCell = FavoriteTabCell()
    
    //Dummy data
    var arrDict = [["usrUserName": "Md Isfaque", "lastMessage": "Hello"], ["usrUserName": "Satish", "lastMessage": "How are you"], ["usrUserName": "Siddarth", "lastMessage": "fine"]]
    /*MARK:--------------------------UI Design(end)-----------------------------*/
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*MARK:--------------------------UI Design(start)-----------------------------*/
        favoriteTableView.delegate = self
        favoriteTableView.dataSource = self
        
        favoriteTableView.tableFooterView = UIView()
        favoriteTableView.alwaysBounceVertical = false
        /*MARK:--------------------------UI Design(end)-----------------------------*/
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    //Button Search People Action
    @IBAction func btnPeopleSelected(_ sender: Any) {
        /*
        let vc = UIStoryboard.init(name: "Search", bundle: Bundle.main).instantiateViewController(withIdentifier: "SearchVC") as? SearchVC
        
        self.navigationController?.pushViewController(vc!, animated: true)*/
        
    }
    
    
    
    
}


/*MARK:---------------------UITableView Delegate and DataSource Functions(start)------------------*/
extension FavoriteTabVC: UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /*
        let vc = UIStoryboard.init(name: "PrivateChat", bundle: Bundle.main).instantiateViewController(withIdentifier: "PrivateChatVC") as? PrivateChatVC
        
        self.navigationController?.pushViewController(vc!, animated: true)*/
        
    }
    
}

extension FavoriteTabVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrDict.count
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        favoriteCell = tableView.dequeueReusableCell(withIdentifier: "FavoriteTabCell") as! FavoriteTabCell
        
        let data = arrDict[indexPath.row]
        favoriteCell.favoriteFriendName.text = data["usrUserName"]
        favoriteCell.favoriteMessage.text = data["lastMessage"]
        
        return favoriteCell
        
        
    }
}
