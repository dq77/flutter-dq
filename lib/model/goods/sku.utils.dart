import 'package:flutter_taozugong_app/model/goods/entity.dart';
import 'package:flutter_taozugong_app/model/goods/entity.sku.dart';
import 'package:flutter_taozugong_app/model/goods/entity.selected.dart';

class SkuUtil {
  // 获取默认选中的sku规格
  static List<SelectedSpec> getDefaultSelectedSku(
      List<SpecificationVOList> specificationVOList) {
    List<SelectedSpec> selectedList = new List<SelectedSpec>();

    // Map<SpecificationKeyVO, SpecificationValueVO> selectedSpec =
    //     Map<SpecificationKeyVO, SpecificationValueVO>();

    // Map<String, SpecificationKeyVO> specificationKeyVO =
    //     new Map<String, SpecificationKeyVO>();
    // Map<String, SpecificationValueVO> specValue =
    //     new Map<String, SpecificationValueVO>();
    // for (var i = 0; i < specificationVOList.length; i++) {

    //   var specificationKeyVO = null;
    //   var specValue = null;

    //   // specificationKeyVO = specificationVOList[i].specificationKeyVO;
    //   // specValue = specificationVOList[i].specificationValueVOList[0];
    //   selectedSpec.specificationKeyVO = specificationVOList[i].specificationKeyVO;
    //   selectedSpec.specValue = specificationVOList[i].specificationValueVOList[0];

    //   selectedList.add(selectedSpec);
    //   print('selectedSpec ${selectedSpec.toString()}');
    //   print('selectedSpec ${selectedSpec is Map}');
    //   print('specificationKeyVO ${specificationKeyVO.toString()}');
    //   print('specValue ${specValue.toString()}');

    // }

    for (var specVO in specificationVOList) {
      SelectedSpec selectedSpec =
          SelectedSpec.fromJson({"specificationKeyVO": {}, "specValue": {}});

      selectedSpec.specificationKeyVO = specVO.specificationKeyVO;
      selectedSpec.specValue = specVO.specificationValueVOList[0];

      selectedList.add(selectedSpec);

      print('selectedSpec ${selectedSpec.toString()}');
      print('selectedSpec ${selectedSpec is Map}');
    }

    print('selectedList ${selectedList.length.toString()}');
    print('获取详情字符串 ${getDetail(selectedList)}');
    print('获取详情字符串NoId ${getDetail(selectedList, noId: true)}');

    // SpecificationValueVO specValue;
    // SpecificationKeyVO specificationKeyVO;
    // SelectedSpec selectedSpec = new SelectedSpec();
    //print('specValue ${specValue.toString()}');
    return selectedList;
  }

  // 判断sku 选中
  static bool isSelectedItem(selectedSpecs, item) {
    print('判断选中 ${item.toString()}');
    print('判断选中 ${selectedSpecs.toString()}');
    for (var spec in selectedSpecs) {
      if (item.specificationKeyId == spec?.specValue?.specificationKeyId &&
          item.name == spec?.specValue?.name) {
        return true;
      }
    }
    return false;
  }

  // 获取已选已选规格的拼接detailPage
  static String getDetail(selectedSpecs, {noId = false}) {
    String detail = '';
    // for(var spec in selectedSpecs){
    //   detail = detail + '${spec?.specValue?.specificationKeyId}:${spec?.specValue?.name},';
    // }
    for (int i = 0; i < selectedSpecs.length; i++) {
      if (i + 1 != selectedSpecs.length) {
        if (noId) {
          detail = detail + '${selectedSpecs[i]?.specValue?.name},';
        } else {
          detail = detail +
              '${selectedSpecs[i]?.specValue?.specificationKeyId}:${selectedSpecs[i]?.specValue?.name},';
        }
      } else {
        if (noId) {
          detail = detail + '${selectedSpecs[i]?.specValue?.name}';
        } else {
          detail = detail +
              '${selectedSpecs[i]?.specValue?.specificationKeyId}:${selectedSpecs[i]?.specValue?.name}';
        }
      }
    }
    return detail;
  }

  // 获取默认租期

  static GoodsSkuData getDefaultSelectedSkuStage(detail, goodsSkuData) {

    print('获取detail ${detail} ${goodsSkuData.toString()}');


    if (detail != '') {
      for (var stageItem in goodsSkuData) {
        if (detail == stageItem.detail) {
          print('stageItem  ${stageItem.toString()}');
          return stageItem;
        }
      }
    } else {

      print('detail 为空得时候');
      // 当商品规格为空的时候
      return goodsSkuData[0];

    }
  }
}
