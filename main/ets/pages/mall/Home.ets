import promptAction from '@ohos.promptAction'
import Item from '../mall/viewmodels/Item'
import { MProductItem } from './MProductItem'

@Component
export default struct Home {

  // 商品数据
  private items: Array<Item> = [
    new Item('HUAWEI70Pro+', $r('app.media.hw1'), 8499,7000,false,"王小","18125545656"),
    new Item('HUAWEIMate X6', $r('app.media.hw2'), 13999,12999,false,"王先生","13800525445"),
    new Item('HUAWEI 非凡大师', $r('app.media.hw3'), 14380,11999,false,"汪明","15925545656"),
    new Item('HUAWEI Pro', $r('app.media.hw4'), 10499,6499 ,false,"李四","18125545656"),
    new Item('MateBook 16s', $r('app.media.dian1'), 9499,6200,false,"王小","18125545656"),
    new Item('MateBook 14s', $r('app.media.dian2'), 12999,7890,false,"吴三","13023156987")
  ]

  build() {
    Column({ space: 8 }) {
      Row() {
        Text('二手交易平台')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
      .height(20)
      .margin({ bottom: 5,left:10 })


      List({space: 8}) {
        ForEach(
          this.items,
          (i: Item) => {
            ListItem(){
              MProductItem({item:i})
            }
          }
        )
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#EFEFEF')
  }

}

