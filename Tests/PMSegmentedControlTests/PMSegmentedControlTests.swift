import XCTest
@testable import PMSegmentedControl

final class PMSegmentedControlTests: XCTestCase {
  private var sut: PMSegmentedControl!
  
  override func setUp() {
    super.setUp()
    sut = PMSegmentedControl(frame: .zero)
    sut.items = ["TEST1", "TEST2"]
  }
  
  override func tearDown() {
    sut = nil
    super.tearDown()
  }
  
  func testSetItems_threeItems_setsOptionsToSegmentControl() {
    // given
    let expected = 3
    
    // when
    sut.items.append("TEST3")
    
    // then
    XCTAssertEqual(sut.items.count, expected)
  }
  
  func testSetFont_avenirNextBold14_setsItemLabelFont() {
    // given
    let expected = UIFont(name: "AvenirNext-Bold", size: 14)

    // when
    sut.font = UIFont(name: "AvenirNext-Bold", size: 14)
    
    // then
    XCTAssertEqual(sut.font, expected)
  }
  
  func testSetSelectedLabelColor_red_setsSelectedLabelColorToRed() {
    // given
    let expected = UIColor.red

    // when
    sut.selectedLabelColor = .red
    
    // then
    XCTAssertEqual(sut.selectedLabelColor, expected)
  }
  
  func testSetUnselectedLabelColor_green_setsSelectedLabelColorToGreen() {
    // given
    let expected = UIColor.green

    // when
    sut.unselectedLabelColor = .green
    
    // then
    XCTAssertEqual(sut.unselectedLabelColor, expected)
  }
  
  func testSetBackgroundColor_black_setsBackgroundColorToBlack() {
    // given
    let expected = UIColor.black

    // when
    sut.backgroundColor = .black
    
    // then
    XCTAssertEqual(sut.backgroundColor, expected)
  }
  
  func testSetBorderColor_orange_setsBorderColorToOrange() {
    // given
    let expected = UIColor.orange

    // when
    sut.borderColor = .orange
    
    // then
    XCTAssertEqual(sut.borderColor, expected)
  }
  
  
  
  func testSetBorderWidth_set2_setsBorderWidthTo2() {
    // given
    let expected = CGFloat(2.0)

    // when
    sut.borderWidth = 2.0
    
    // then
    XCTAssertEqual(sut.borderWidth, expected)
  }
  
  func testSetThumbColorColor_white_setsThumbColorToWhite() {
    // given
    let expected = UIColor.white

    // when
    sut.thumbColor = .white
    
    // then
    XCTAssertEqual(sut.thumbColor, expected)
  }
  
  func testSetSelectedIndex_secondIndex_setsSecondItem() {
    // given
    let expected = 1

    // when
    sut.selectedIndex = 1
    
    // then
    XCTAssertEqual(sut.selectedIndex, expected)
  }
  
  static var allTests = [
    ("testSetItems_threeItems_setsOptionsToSegmentControl", testSetItems_threeItems_setsOptionsToSegmentControl),
    ("testSetFont_avenirNextBold14_setsItemLabelFont", testSetFont_avenirNextBold14_setsItemLabelFont),
    ("testSetSelectedLabelColor_red_setsSelectedLabelColorToRed", testSetSelectedLabelColor_red_setsSelectedLabelColorToRed),
    ("testSetUnselectedLabelColor_green_setsSelectedLabelColorToGreen", testSetUnselectedLabelColor_green_setsSelectedLabelColorToGreen),
    ("testSetBackgroundColor_black_setsBackgroundColorToBlack", testSetBackgroundColor_black_setsBackgroundColorToBlack),
    ("testSetBorderColor_orange_setsBorderColorToOrange", testSetBorderColor_orange_setsBorderColorToOrange),
    ("testSetThumbColorColor_white_setsThumbColorToWhite", testSetThumbColorColor_white_setsThumbColorToWhite),
    ("testSetSelectedIndex_secondIndex_setsSecondItem", testSetSelectedIndex_secondIndex_setsSecondItem)
  ]
}
