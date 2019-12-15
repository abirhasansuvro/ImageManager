class ImageModel{
  int id;
  String url;
  String title;
  ImageModel(this.id,this.url,this.title);
  ImageModel.fromJSON(obj){
    id=obj['id'];
    url=obj['url'];
    title=obj['title'];
  }
}