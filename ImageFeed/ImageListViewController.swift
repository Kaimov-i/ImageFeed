//
//  ViewController.swift
//  ImageFeed
//
//  Created by Ilman on 02.01.2026.
//

import UIKit

class ImageListViewController: UIViewController {


    @IBOutlet private var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .ypBlack
        tableView.delegate = self
        tableView.dataSource = self
    }


}

extension ImageListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        0
    }
}

extension ImageListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
