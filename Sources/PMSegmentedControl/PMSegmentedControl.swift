//
//  PMSegmentedControl.swift
//  PMSegmentedControl
//
//  Created by Pawel Milek on 07/11/2020.
//

import UIKit

@IBDesignable
public class PMSegmentedControl: UIControl {
  public weak var delegate: PMSegmentedControlDelegate?

  private var labels = [UILabel]()
  private var thumbView = UIView()
  
  public var items: [String] = ["Item 1"] {
    didSet {
      setupLabels()
    }
  }
  
  public var selectedIndex: Int = 0 {
    didSet {
      displayNewSelectedIndex()
    }
  }
  
  @IBInspectable
  public var selectedLabelColor: UIColor = .black {
    didSet {
      setSelectedColors()
    }
  }
  
  @IBInspectable
  public var unselectedLabelColor: UIColor = .white {
    didSet {
      setSelectedColors()
    }
  }
  
  @IBInspectable
  public var thumbColor: UIColor = .white {
    didSet {
      setSelectedColors()
    }
  }
  
  @IBInspectable
  public var borderColor: UIColor = .white {
    didSet {
      layer.borderColor = borderColor.cgColor
    }
  }
  
  @IBInspectable
  public var borderWidth: CGFloat = 0.5 {
    didSet {
      layer.borderWidth = borderWidth
    }
  }
  
  @IBInspectable
  public var font: UIFont! = UIFont.systemFont(ofSize: 12) {
    didSet {
      setFont()
    }
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    setUp()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setUp()
  }
  
  
  public override func layoutSubviews() {
    super.layoutSubviews()
    
    var selectedFrame = self.bounds
    let newWidth = selectedFrame.size.width / CGFloat(items.count)
    selectedFrame.size.width = newWidth
    
    thumbView.frame = selectedFrame
    thumbView.backgroundColor = thumbColor
    thumbView.layer.cornerRadius = thumbView.frame.height / 2
    
    let labelHeight = self.bounds.height
    let labelWidth = self.bounds.width / CGFloat(items.count)
    
    for (index, label) in labels.enumerated() {
      let xPos = CGFloat(index) * labelWidth
      let yPos = CGFloat(0)
      label.frame = CGRect(x: xPos, y: yPos, width: labelWidth, height: labelHeight)
    }
    
    displayNewSelectedIndex()
  }
  
  
  public override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
    let location = touch.location(in: self)
    var calculatedIndex: Int?
    
    for (index, label) in labels.enumerated() {
      if label.frame.contains(location) {
        calculatedIndex = index
      }
    }
    
    guard let foundIndex = calculatedIndex else { return false }
    selectedIndex = foundIndex
    sendActions(for: .valueChanged)
    return true
  }
}


// MARK: - Private - SetUps
private extension PMSegmentedControl {
  
  func setUp() {
    self.addTarget(self, action: #selector(PMSegmentedControl.segmentValueDidChange(_:)), for: .valueChanged)
    layer.cornerRadius = frame.height / 2
    layer.borderColor = UIColor.orange.cgColor
    layer.borderWidth = 0.5
    backgroundColor = .clear
    
    setupLabels()
    insertSubview(thumbView, at: 0)
  }
  
  func setupLabels() {
    labels.forEach { $0.removeFromSuperview() }
    labels.removeAll(keepingCapacity: true)
    
    for (index, item) in items.enumerated() {
      let label = UILabel(frame: .zero)
      label.text = item
      label.textAlignment = .center
      label.textColor = (index == 0 ? selectedLabelColor : unselectedLabelColor)
      addSubview(label)
      labels.append(label)
    }
  }
  
  func setSelectedColors() {
    labels.forEach { $0.textColor = unselectedLabelColor }
    if labels.isEmpty == false {
      labels.first?.textColor = selectedLabelColor
    }
    
    thumbView.backgroundColor = thumbColor
  }
  
  func setFont() {
    labels.forEach { $0.font = font }
  }
  
  func displayNewSelectedIndex() {
    labels.forEach { $0.textColor = unselectedLabelColor }
    
    let selectedLabel = labels[selectedIndex]
    selectedLabel.textColor = selectedLabelColor
    
    UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.8, options: [], animations: {
      self.thumbView.frame = selectedLabel.frame
    })
  }
  
}

// MARK: - Private - Segment value did change
private extension PMSegmentedControl {
  
  @objc func segmentValueDidChange(_ sender: PMSegmentedControl) {
    delegate?.segmentedControlValueDidChange(sender)
  }
  
}
