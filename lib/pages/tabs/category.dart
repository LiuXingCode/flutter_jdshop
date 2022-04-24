import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jdshop/config/config.dart';
import 'package:flutter_jdshop/model/cate_model.dart';
import 'package:flutter_jdshop/services/screen_adapter.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  int _selectedIndex = 0;
  List<CateItemModel> _leftCateList = [];
  List<CateItemModel> _rightCateList = [];

  @override
  void initState() {
    super.initState();
    _getLeftCateData();
  }

  _getLeftCateData() async {
    var api = "${Config.domain}api/pcate";
    var result = await Dio().get(api);
    var leftCate = CateModel.fromJson(result.data);
    setState(() {
      _leftCateList = leftCate.result;
    });
    _getRightCateData(_leftCateList.first.sId);
  }

  _getRightCateData(pid) async {
    var api = "${Config.domain}api/pcate?pid=$pid";
    var result = await Dio().get(api);
    var rightCate = CateModel.fromJson(result.data);
    setState(() {
      _rightCateList = rightCate.result;
    });
  }

  //左侧分类
  Widget _leftCateWidget(double leftWidth) {
    if (_leftCateList.isNotEmpty) {
      return Container(
        height: double.infinity,
        width: 140,
        child: ListView.builder(
            itemCount: _leftCateList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _selectedIndex = index;
                        _getRightCateData(_leftCateList[index].sId);
                      });
                    },
                    child: Container(
                      child: Text(
                        "${_leftCateList[index].title}",
                        textAlign: TextAlign.center,
                      ),
                      height: ScreenAdaper.height(84),
                      padding: EdgeInsets.only(top: ScreenAdaper.height(24)),
                      width: double.infinity,
                      color: _selectedIndex == index
                          ? Color.fromRGBO(240, 246, 246, 0.9)
                          : Colors.white,
                    ),
                  ),
                  Divider(height: 1),
                ],
              );
            }),
      );
    } else {
      return Container(height: double.infinity, width: 140);
    }
  }

  Widget _rightCateWidget(double rightItemWidth, double rightItemHeight) {
    if (_rightCateList.isNotEmpty) {
      return Expanded(
        flex: 1,
        child: Container(
          padding: const EdgeInsets.all(10),
          color: const Color.fromRGBO(240, 246, 246, 0.9),
          height: double.infinity,
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: rightItemWidth / rightItemHeight,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemCount: _rightCateList.length,
              itemBuilder: (context, index) {
                String pic = _rightCateList[index].pic ?? "";
                pic = Config.domain + pic.replaceAll("\\", "/");
                return InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, "/productList", arguments:{
                      "cid": _rightCateList[index].sId
                    });
                  },
                  child: Container(
                    child: Column(
                      children: [
                        AspectRatio(
                          aspectRatio: 1,
                          child: Image.network(
                            pic,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          height: ScreenAdaper.height(28),
                          child: Text(_rightCateList[index].title ?? ""),
                        )
                      ],
                    ),
                  ),
                );
              }),
        ),
      );
    } else {
      return Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.all(10),
            color: Color.fromRGBO(240, 246, 246, 0.9),
            height: double.infinity,
            child: Text("加载中"),
          )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = ScreenAdaper.getScreenWidth();
    var leftWidth = screenWidth / 4;
    var rightItemWidth = (screenWidth - leftWidth - 20 - 20) / 3;
    rightItemWidth = ScreenAdaper.width(rightItemWidth);
    var rightItemHeight = rightItemWidth + ScreenAdaper.height(28);
    return Row(
      children: [
        _leftCateWidget(leftWidth),
        _rightCateWidget(rightItemWidth, rightItemHeight)
      ],
    );
  }
}
