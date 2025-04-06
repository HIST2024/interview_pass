import { QuestionItemComp } from './QuestionItemComp'
import { QuestionItem } from '../../models'

@Component
export struct QuestionListComp {
  @State list: QuestionItem[] = []
  @State isRefreshing: boolean = false
  @State isFinished: boolean = false
  @State isLoading: boolean = false

  // 上拉加载
  onLoad() {
    setTimeout(() => {
      for (let i = 0; i < 10; i++) {
        this.list.push({} as QuestionItem)
      }
      this.isLoading = false
      if (this.list.length >= 40) {
        this.isFinished = true
      }
    }, 1000)
  }

  // 下拉刷新
  onRefresh() {
    setTimeout(() => {
      this.list = []
      for (let i = 0; i < 10; i++) {
        this.list.push({} as QuestionItem)
      }
      // 下拉刷新，所有状态都重置
      this.isRefreshing = false
      this.isFinished = false
    }, 1000)
  }

  build() {
    Refresh({ refreshing: $$this.isRefreshing }) {
      List() {
        ForEach(new Array(10).fill(0), () => {
          ListItem() {
            QuestionItemComp({
              item: {
                id: '100',
                stem: '请说下ArkUI的容器组件有哪些？',
                difficulty: 3,
                likeCount: 23,
                views: 423,
                readFlag: 1
              }
            })
          }
        })
        this.LoadMoreBuilder()
      }
      .divider({
        strokeWidth: 0.5,
        color: $r('app.color.common_gray_border'),
        startMargin: 16,
        endMargin: 16
      })
      .width('100%')
      .height('100%')
      .scrollBar(BarState.Off)
      .edgeEffect(EdgeEffect.None)
      .onReachEnd(() => {
        if (this.isLoading || this.isFinished || this.isRefreshing) {
          return
        }
        this.isLoading = true
        this.onLoad()
      })
    }
    .onRefreshing(() => {
      this.onRefresh()
    })
  }

  @Builder
  LoadMoreBuilder() {
    ListItem() {
      // 加载完成
      if (this.isFinished) {
        Row() {
          Text('没有更多了~')
            .fontSize(14)
            .fontColor($r('app.color.common_gray_03'))
        }
        .justifyContent(FlexAlign.Center)
        .width('100%')
      } else if (this.isLoading) {
        // 没有加载完成且正在加载中
        Row({ space: 4 }) {
          LoadingProgress()
            .width(20)
          Text('正在加载...')
            .fontSize(14)
            .fontColor($r('app.color.common_gray_03'))
        }
        .justifyContent(FlexAlign.Center)
        .width('100%')
      }
    }
    .height(80)
  }
}
