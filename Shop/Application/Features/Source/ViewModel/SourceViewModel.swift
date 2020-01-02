//
//  SourceViewModel.swift
//  Shop
//
//  Created by Grzegorz Makowski on 01/01/2020.
//  Copyright © 2020 Grzegorz Makowski. All rights reserved.
//

import Foundation

final class SourceViewModel {
    
    // MARK: Properties
    
    private(set) var offlineTap: Observable<AppEvent> = Observable<AppEvent>(value: .void)
    private(set) var onlineTap: Observable<AppEvent> = Observable<AppEvent>(value: .void)
}
