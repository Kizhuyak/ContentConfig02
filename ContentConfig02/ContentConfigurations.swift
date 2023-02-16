//
//  ContentConfigurations.swift
//  ContentConfig02
//
//  Created by David DeWolfe on 2/14/23.
//

import UIKit

struct compactConfiguration: UIContentConfiguration, Hashable {
    func makeContentView() -> UIView & UIContentView {
        return CompactCellView(configuration: self)!
    }
    
    func updated(for state: UIConfigurationState) -> Self {
        guard let state = state as? UICellConfigurationState else { return self }

        var updatedConfig = self

        if state.isSelected || state.isHighlighted {
            
        }
        return updatedConfig
    }
}

struct regularConfiguration: UIContentConfiguration, Hashable {
    func makeContentView() -> UIView & UIContentView {
        return RegularCellView(configuration: self)!
    }
    
    func updated(for state: UIConfigurationState) -> Self {
        guard let state = state as? UICellConfigurationState else { return self }

        var updatedConfig = self

        if state.isSelected || state.isHighlighted {
            
        }
        return updatedConfig
    }
    

}
