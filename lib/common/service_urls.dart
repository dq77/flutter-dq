import 'package:flutter_taozugong_app/common/config.dart';


/// swagger 地址
/// https://api.taozugong.cn/swagger-ui.html#/order-trade-controller/recordRefundUsingPOST
///
///

final serviceUrls = {
  'apiGetWelcomePags':'/goods/app_welcome_page/client/list',
  'apiGetBannerlist': '/goods/banner/client/banner_list',
  'apiGetNavList':'/goods/nav/client/list',
  'apiGetRecommendationList':'/goods/recommendation/client/list',
  'apiGetChannelCategorylist':'/goods/channel_category/client/list/{channel}',
  'apiGetGoodsBrandList':'/goods/client/goods_brand_list',
  'apiGetGoodsDetail':'/goods/client/goods_detail/{no}',
  'apiGetGoodsList':'/goods/client/goods_list',
  'apiGetLuckDrawGoodsList':'/goods/client/luck_draw/goods_list',
  'apiGetPopUpByChannel':'/goods/pop/client/pop_up_channel/{channel}',
  'apiGetSkuStockBySkuId':'/goods/sku/client/check_sku_stock/{skuId}',
  'apiGetSkuListByGoodsNo':'/goods/sku/client/sku_list/{no}'
};