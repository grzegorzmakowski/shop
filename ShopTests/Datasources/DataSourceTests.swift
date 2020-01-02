//
//  DataSourceTests.swift
//  ShopTests
//
//  Created by Grzegorz Makowski on 01/01/2020.
//  Copyright © 2020 Grzegorz Makowski. All rights reserved.
//

import XCTest
@testable import Shop
@testable import DomainModule

class DataSourceTests: XCTestCase {
    
    var dataSource: DataSource<BasketProductViewCellViewModel, BasketProductViewCell>!
    var tableView: UITableView!
    

    override func setUp() {
        tableView = UITableView()
        tableView.register(BasketProductViewCell.self)
        dataSource = DataSource<BasketProductViewCellViewModel, BasketProductViewCell>()
    }

    override func tearDown() {
        dataSource = nil
    }

    func testNumberOfRows() {
        // given
        
        let viewModels: [BasketProductViewCellViewModel] = [
            BasketProductViewCellViewModel(basketProduct: BasketCarProduct(product: Car(id: "BMW", name: "BMW", price: 100.0))),
            BasketProductViewCellViewModel(basketProduct: BasketCarProduct(product: Car(id: "BMW", name: "BMW", price: 100.0)))
        ]
        
        // when
        dataSource.items.value = viewModels
        
        // then
        
        XCTAssertEqual(2, dataSource.tableView(tableView, numberOfRowsInSection: 0))
    }
    
    func testCellDequeue() {
        // given
        
        let viewModels: [BasketProductViewCellViewModel] = [
            BasketProductViewCellViewModel(basketProduct: BasketCarProduct(product: Car(id: "BMW", name: "BMW", price: 100.0))),
            BasketProductViewCellViewModel(basketProduct: BasketCarProduct(product: Car(id: "BMW", name: "BMW", price: 100.0)))
        ]
        
        // when
        dataSource.items.value = viewModels
        
        // then
        
        let cell = dataSource.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        
        XCTAssert(cell is BasketProductViewCell)
    }
    
}
