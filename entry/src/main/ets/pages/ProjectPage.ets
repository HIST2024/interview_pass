@Component
export struct ProjectPage {
  build() {
    RowSplit() {
      Text('1').width('10%').height(100).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
      Text('2').width('10%').height(100).backgroundColor(0xD2B48C).textAlign(TextAlign.Center)
      Text('3').width('10%').height(100).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
      Text('4').width('10%').height(100).backgroundColor(0xD2B48C).textAlign(TextAlign.Center)
      Text('5').width('10%').height(100).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
    }
    .resizeable(true) // 可拖动
    .width('90%').height(100)
  }
}