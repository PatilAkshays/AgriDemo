//
//  ViewController.swift
//  URLDemo
//
//  Created by Manish Ingale on 30/08/21.
//

import UIKit
import MBProgressHUD

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    var agriViewModel = AgriViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.getAgriApiData()
        // Do any additional setup after loading the view.
    }

    func getAgriApiData(){
        if Connectivity.isConnectedToInternet(){
            self.showLoading()
            self.agriViewModel.requestAgriApiData { (response, result) in
                DispatchQueue.main.async {
                    self.hideLoading()
                    if response != nil && result.success {
                        ///Success
                        self.tableView.reloadData()
                    }else{
                        self.showAlertWith(msg: result.errorMessage ?? "Error")
                    }
                }
                
            }
        }else{
            self.showAlertWith(msg: "Please connect with Internet!")
        }
    }

    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return agriViewModel.getAgriApiResponse.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AgriCell", for: indexPath) as! AgriCell
        let object = agriViewModel.getAgriApiResponse[indexPath.row]
        cell.loadCellData(agriData: object)
        return cell
    }
    
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return UITableView.automaticDimension
    }
    
}

extension ViewController {
    //Method to Show Loader
    func showLoading() {
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.label.text = "Loading"
    }
    
    //Method to hide Loader
    func hideLoading() {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
    //Method to display Alert Message
    func showAlertWith(msg: String) {
        let alert = UIAlertController(title:"Alert", message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: { (_action) in
            
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
