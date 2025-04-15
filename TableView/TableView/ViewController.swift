//
//  ViewController.swift
//  TableView
//
//  Created by Andrew Atkins on 4/8/25.
//

import UIKit
class Product{
    var productName: String
    var productDescription:String
    init(prodName:String, prodDesc: String){
        self.productName = prodName
        self.productDescription = prodDesc
        
    }
    //end of class
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return product array count
        return productArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //ceate a cell
        let cell = TableViewOL.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath)
        //populate the cell
        cell.textLabel?.text = productArray[indexPath.row].productName
        
        //return the cell
        return cell
    }
    

    @IBOutlet weak var TableViewOL: UITableView!
    var productArray=[Product]()
    override func viewDidLoad() {
        super.viewDidLoad()
        TableViewOL.dataSource = self
        TableViewOL.delegate = self
        
        let product1 = Product(prodName: "Iphone 16", prodDesc: "This is a new iphone 16")
        productArray.append(product1)
        let product2 = Product(prodName: "MacBook Pro", prodDesc: "This is a new MacBook Pro")
        productArray.append(product2)

        let product3 = Product(prodName: "Airpods Pro", prodDesc: "This is a new Airpods Pro")
        productArray.append(product3)

        let product4 = Product(prodName: "Apple Watch Series 8", prodDesc: "This is a new Apple Watch")
        productArray.append(product4)

        let product5 = Product(prodName: "Ipad Pro 11-inch", prodDesc: "This is a new Ipad")
        productArray.append(product5)

        
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let transition = segue.identifier
        if transition == "ProductSegue"{
            var destination = segue.destination as! ResultViewController
            destination.product = productArray [(TableViewOL.indexPathForSelectedRow?.row)!]
        }
    }
}

