//
//  CellViews.swift
//  ContentConfig02
//
//  Created by David DeWolfe on 2/14/23.
//

import UIKit

class CompactCellView: UIView, UIContentView {

    @IBOutlet var containerView: UIView!
    @IBOutlet var NameLabel: UILabel!
    @IBOutlet var QuantityLabel: UILabel!
    @IBOutlet var DateUpdatedLabel: UILabel!
    
    
    private var currentConfiguration: compactConfiguration!
    
    var configuration: UIContentConfiguration {
        get {
            currentConfiguration
        }
        set {
            guard let newConfiguration = newValue as? compactConfiguration else {
                return
            }
        
        apply(configuration: newConfiguration)
        }
    }
    
    init?(configuration: compactConfiguration) {
        super.init(frame: .zero)
        loadNib()
        apply(configuration: configuration)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder) has not been implemented")
    }
    
}

private extension CompactCellView {
    
    func loadNib() {
        
        Bundle.main.loadNibNamed("\(CompactCellView.self)", owner: self)
        addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView!.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerView!.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            containerView!.topAnchor.constraint(equalTo: self.topAnchor),
            containerView!.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    func apply(configuration: compactConfiguration) {
        
        currentConfiguration = configuration
        NameLabel.text = configuration.name
        guard let quantity = configuration.quantity else {
            return
        }
        QuantityLabel.text = String(describing: quantity)
        DateUpdatedLabel.text = configuration.date
    }
}

class RegularCellView: UIView, UIContentView {
    
    @IBOutlet var containerView: UIView!
    @IBOutlet var NameLabel: UILabel!
    @IBOutlet var QuantityLabel: UILabel!
    @IBOutlet var DateUpdatedLabel: UILabel!
    
    private var currentConfiguration: regularConfiguration!
    
    var configuration: UIContentConfiguration {
        get {
            currentConfiguration
        }
        set {
            guard let newConfiguration = newValue as? regularConfiguration else {
                return
            }
        
        apply(configuration: newConfiguration)
        }
    }
    
    init?(configuration: regularConfiguration) {
        super.init(frame: .zero)
        loadNib()
        apply(configuration: configuration)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder) has not been implemented")
    }
}

private extension RegularCellView {
    
    func loadNib() {
        
        Bundle.main.loadNibNamed("\(RegularCellView.self)", owner: self)
        addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView!.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerView!.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            containerView!.topAnchor.constraint(equalTo: self.topAnchor),
            containerView!.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    func apply(configuration: regularConfiguration) {
        
        currentConfiguration = configuration
        
        NameLabel.text = configuration.name
        guard let quantity = configuration.quantity else {
            return
        }
        QuantityLabel.text = String(describing: quantity)
        DateUpdatedLabel.text = configuration.date
    }
}
