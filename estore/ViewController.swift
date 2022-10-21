//
//  ViewController.swift
//  estore
//
//  Created by Nicolas Barbosa on 14/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    var data = [Product]()
    
    func fetchingAPIData() {
            Task {
                do {
                    let products = try await API.shared.getProduct()
                    self.data = products
                    print(data)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } catch {
                    print(error)
                }
            }
        }

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(TableViewCell.self,
                           forCellReuseIdentifier: TableViewCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        fetchingAPIData()
        view.addSubview(tableView)
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        let currentProduct = data[indexPath.row]
        cell.configure(with: currentProduct)
        return cell
    }
}
