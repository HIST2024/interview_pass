import { HcClockIn, HcSearchBox } from '../commons/components'

@Component
export struct HomePage {
  @StorageProp('topHeight') topHeight: number = 0

  build() {
    Column() {
      Row({ space: 16 }) {
        Image($r('app.media.ic_home_scan'))
          .width(24)
          .aspectRatio(1)
        Blank()
        HcSearchBox({ layoutWeightValue: 1 })
        HcClockIn()
      }
      .padding({ left: 16, right: 16 })
      .height(64)
      .width('100%')

    }
    .padding({ top: this.topHeight })
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.common_gray_bg'))
  }
}