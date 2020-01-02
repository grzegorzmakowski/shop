//
//  BasePickerDatasource.swift
//  Shop
//
//  Created by Grzegorz Makowski on 01/01/2020.
//  Copyright © 2020 Grzegorz Makowski. All rights reserved.
//

import UIKit

protocol BasePickerViewModel {
    associatedtype Model
    var model: Model { get set }
    var title: String { get }
}

final class BasePickerDatasource<PickerModel: BasePickerViewModel>: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {
    
    // MARK: Properties
    
    private(set) var items: Observable<[PickerModel]> = Observable<[PickerModel]>(value: [])
    private(set) var selected: Observable<PickerModel?> = Observable<PickerModel?>(value: nil)
    
    // MARK: UIPickerDataSource & UIPickerViewDelegate
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return items.value.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return items.value[row].title
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedModel = items.value[row]
        selected.value = selectedModel
    }
}
