import { QuestionListComp } from '../../commons/components'
import { http } from '../../commons/utils'
import { QuestionType } from '../../models'

@Component
export struct HomeCategory {
  @State questionTypeList: QuestionType[] = []
  @State activeIndex: number = 0

  async getQuestionTypeList() {
    const res = await http.request<QuestionType[]>({ url: 'question/type' })
    this.questionTypeList = res
  }

  aboutToAppear(): void {
    this.getQuestionTypeList()
  }

  build() {
    Tabs({ index: this.activeIndex }) {
      ForEach(this.questionTypeList, (item: QuestionType, i) => {
        TabContent() {
          QuestionListComp({ typeId: item.id })
        }
        .tabBar(this.TabBarBuilder(item, i))
      })
    }
    .onTabBarClick((i) => {
      this.activeIndex = i
    })
    .barMode(BarMode.Scrollable)
    .barHeight(44)
    .scrollable(false)
    .divider({ strokeWidth: 0.5, color: $r('app.color.common_gray_border') })
  }

  @Builder
  TabBarBuilder(item: QuestionType, i: number) {
    Row() {
      Stack({ alignContent: Alignment.Bottom }) {
        Text(item.name)
          .fontSize(15)
          .fontColor(this.activeIndex === i ? $r('app.color.black') : $r('app.color.common_gray_01'))
          .height(44)
        Text()
          .width(this.activeIndex === i ? 20 : 0)
          .height(2)
          .backgroundColor($r('app.color.black'))
          .animation({ duration: this.activeIndex === i ? 300 : 0 })
      }

      if (item.displayNewestFlag === 1) {
        Image($r('app.media.ic_home_new'))
          .width(32)
          .height(14)
          .objectFit(ImageFit.Contain)
          .margin({ left: 4 })
      }
    }
    .padding({ left: 16, right: this.questionTypeList.length === i + 1 ? 16 : 0 })
  }
}
