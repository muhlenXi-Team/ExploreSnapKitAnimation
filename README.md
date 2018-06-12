# ExploreSnapKitAnimation
About SnapKit animation.

动画示例：

```swift
func showDismissBtn() {
    self.dismissBtn.snp.updateConstraints { (maker) in
        maker.width.equalTo(64)
    }
    self.dismissBtn.setNeedsUpdateConstraints()
    UIView.animate(withDuration: 0.3) {
        self.view.layoutIfNeeded()
    }
}
```

