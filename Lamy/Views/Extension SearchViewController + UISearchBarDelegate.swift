//
//  Extension SearchViewController + UISearchBarDelegate.swift
//  Lamy
//
//  Created by mix on 18.4.24..
//

import UIKit

extension SearchViewController: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { (_) in
            self.dataManager.fetchData(for: "") {
                self.tableView.reloadData()
            }
        }
    }
    
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            timer?.invalidate()
            timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { (_) in
                self.dataManager.fetchData(for: searchText) {
                    self.tableView.reloadData()
                }
            }
        }
    }