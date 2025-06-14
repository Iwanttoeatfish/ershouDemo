import Item from '../mall/viewmodels/Item'
import promptAction from '@ohos.promptAction'

@Component
export struct MProductItem {
  @ObjectLink item: Item

  build() {

    Row({space: 10}){
      Image(this.item.image)
        .width(90)
      Column({space: 5}){
        if(this.item.discount){
          Text(this.item.name)
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
          Text('原价：￥'+ this.item.price)
            .fontColor('#CCC')
            .fontSize(14)
            .decoration({type: TextDecorationType.LineThrough})
          Text('出手价：￥' + this.item.discount)
            .fontColor('#F36')
            .fontSize(15)

        }else {
          Text(this.item.name)
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
          Text('￥'+ this.item.price)
            .fontColor('#F36')
            .fontSize(15)
        }
      }
      .height('100%')
      .alignItems(HorizontalAlign.Start)
      Blank()
      if(this.item.isLove){
        this.CreateIco($r("app.media.icon_red"),this.item)
      }else{
        this.CreateIco($r("app.media.icon_col"),this.item)
      }
    }
    .width('100%')
    .backgroundColor('#FFF')
    .borderRadius(20)
    .height(120)
    .padding(10)

  }

  @Builder
  CreateIco(icon:Resource,item:Item){
    Image(icon)
      .width(28)
      .height(28)
      .objectFit(ImageFit.Contain)
      .margin(20)
      .onClick(()=>{
        this.btnSubmt()
      })
  }

  btnSubmt():void{
    this.item.isLove = !this.item.isLove
    //item.isLove = !item.isLove
    console.log(" "+this.item.isLove)

    promptAction.showDialog({title:'联系方式',
      message: '请联系'+this.item.userName+""+this.item.phone,
      buttons: [
        {
          text: '取消',
          color: '#000000',
        },
        {
          text: '确定',
          color: 'red',
        }
      ],

    },(err,data)=>{
      if (err) {
        return;
      }
    })
  }
}
