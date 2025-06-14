import Home from './mall/Home'
import TabBarViewModel from './mall/viewmodels/TabBarViewModel'

@Entry
@Component
struct Index {
  private tabBarViewModels: TabBarViewModel[] = [
    new TabBarViewModel('首页', $r('app.media.sy'), $r('app.media.homepage_sel'), 0),
    new TabBarViewModel('我的', $r('app.media.wd'), $r('app.media.user_sel'), 1)
  ]
  @State selectedIndex: number = 0
  @State prodCount: number = 10
  private tabsController: TabsController = new TabsController()
  //  @ObjectLink
  @Builder
  buildTabBar(tabBarViewModel: TabBarViewModel) {
    // Badge({
    //   count: tabBarViewModel.title == '购物车' ? this.prodCount : 0,
    //   position: BadgePosition.RightTop,
    //   style: { badgeSize: 13, badgeColor: '#FA2A2D' }
    // }) {
      Column() {
        Image(this.selectedIndex == tabBarViewModel.index ? tabBarViewModel.selectedImage : tabBarViewModel.image)
          .width(20)
          .height(20)
          .margin({ top: 3 })
        Text(tabBarViewModel.title)
          .fontSize(12)
          .fontWeight(500)
          .margin({ top: 5 })
          .fontColor(this.selectedIndex == tabBarViewModel.index ? '#00aaff' : Color.Black)

      }.height(50)
    //}

  }

  build() {
    Tabs({ controller: this.tabsController }) {
      TabContent() {
        Home()
      }
      .tabBar(this.buildTabBar(this.tabBarViewModels[0]))

      TabContent() {
        Text('我的')
      }
      .tabBar(this.buildTabBar(this.tabBarViewModels[1]))

    }.barPosition(BarPosition.End)
    .width('100%')
    .onChange((index: number) => {
      this.selectedIndex = index
    })
  }
}