//
//  TestPMSegmentedControlDelegate.swift
//  PMSegmentedControl
//
//  Created by Pawel Milek on 07/11/2020.
//

@testable import PMSegmentedControl

final class TestPMSegmentedControlDelegate: PMSegmentedControlDelegate {
  var isValueChanged = false
  
  func segmentedControlValueDidChange(_ sender: PMSegmentedControl) {
    isValueChanged = true
  }
}
