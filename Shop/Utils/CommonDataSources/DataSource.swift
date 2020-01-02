//
//  DataSource.swift
//  Shop
//
//  Created by Grzegorz Makowski on 01/01/2020.
//  Copyright © 2020 Grzegorz Makowski. All rights reserved.
//

import UIKit

final class DataSource<CellModel, Cell: CellConfigurable>: NSObject, UITableViewDataSource where Cell.T == CellModel {
    
    // MARK: Properties
    
    private(set) var items: Observable<[CellModel]> = Observable<[CellModel]>(value: [])
    
    // MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.reuseIdentifier, for: indexPath) as? Cell else {
            assertionFailure("Verify implementation \( String(describing: Cell.self))")
            return UITableViewCell()
        }
        let viewModel = items.value[indexPath.row]
        cell.bind(viewModel)
        
        return cell
    }
}
