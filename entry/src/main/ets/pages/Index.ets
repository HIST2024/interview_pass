import { HomePage } from './HomePage';
import { InterviewPage } from './InterviewPage';
import { MinePage } from './MinePage';
import { ProjectPage } from './ProjectPage';

interface TabItem {
  icon: Resource;
  activeIcon: Resource;
  name: string;
}

@Entry
@Component
struct Index {
  @StorageProp('topHeight') topHeight: number = 0
  @StorageProp('bottomHeight') bottomHeight: number = 0
  @State activeIndex: number = 0
  tabList: TabItem[] = [
    {
      icon: $r('app.media.tabbar_home'),
      activeIcon: $r('app.media.tabbar_home_fill'),
      name: '首页'
    },
    {
      icon: $r('app.media.tabbar_project'),
      activeIcon: $r('app.media.tabbar_project_fill'),
      name: '项目'
    },
    {
      icon: $r('app.media.tabbar_interview'),
      activeIcon: $r('app.media.tabbar_interview_fill'),
      name: '面经'
    },
    {
      icon: $r('app.media.tabbar_mine'),
      activeIcon: $r('app.media.tabbar_mine_fill'),
      name: '我的'
    }
  ]

  build() {
    Column() {
      Tabs({ index: this.activeIndex }) {
        ForEach(this.tabList, (item: TabItem, i) => {
          TabContent() {
            if (i === 0) {
              HomePage()
            } else if (i === 1) {
              ProjectPage()
            } else if (i === 2) {
              InterviewPage()
            } else {
              MinePage()
            }
          }
          .tabBar(this.TabBarBuilder(item, i))
        })
      }
      .animationDuration(0)
      .divider({ strokeWidth: 0.5, color: $r('app.color.common_gray_border') })
      .barPosition(BarPosition.End)
      .padding({ bottom: this.bottomHeight })
      .onChange(i => {
        this.activeIndex = i
      })
    }
    .width('100%')
    .height('100%')
  }

  @Builder
  TabBarBuilder(item: TabItem, index: number) {
    Column({ space: 5 }) {
      Image(this.activeIndex === index ? item.activeIcon : item.icon)
        .width(24)
        .aspectRatio(1)
      Text(item.name)
        .fontSize(12)
        .fontColor(this.activeIndex === index ? $r('app.color.black') : $r('app.color.common_gray_01'))
    }
  }
}