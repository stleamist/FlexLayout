import FlexLayout
#if SWIFT_PACKAGE
import FlexLayoutYogaKit
#endif
import Testing
import UIKit

@MainActor
struct GapTests {
    @Test(arguments: [true, false])
    func laysOutChildrenWithPointGaps(horizontal: Bool) {
        let root = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        let first = UIView()
        let second = UIView()
        root.flex.direction(horizontal ? .row : .column).gap(8).columnGap(12).rowGap(16).define { flex in
            flex.addItem(first).width(20).height(20)
            flex.addItem(second).width(20).height(20)
        }
        root.flex.layout()

        #expect(root.yoga.gap == 8)
        #expect(root.yoga.columnGap == 12)
        #expect(root.yoga.rowGap == 16)
        if horizontal {
            #expect(second.frame.minX - first.frame.maxX == 12)
        } else {
            #expect(second.frame.minY - first.frame.maxY == 16)
        }
    }
}
