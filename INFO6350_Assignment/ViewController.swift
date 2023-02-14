import Foundation
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    let myData = ["Big Mac", "Spicy Crispy Chicken Sandwich", "Chicken McNuggets", "World Famous Fries", "Quarter Pounder®* with Cheese","Hot Coffe", "Hot tea"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "CustomTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CustomTableViewCell")

        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           tableView.deselectRow(at: indexPath, animated: true)
        print("Row:", indexPath.row)
    }
}

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        cell.myLabel.text = myData[indexPath.row]
        cell.myImageView.backgroundColor = .white
        cell.myImageView.image = UIImage(named: myData[indexPath.row])
        return cell
    }
}
