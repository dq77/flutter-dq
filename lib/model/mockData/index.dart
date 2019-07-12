class Tabber {
  static const List<String> tabs = ['首页', '餐厨', '洗护', '居家', '电器'];
  static const List<String> productParam = ['租赁概述', '规格详情', '售后说明'];
  static const List categoryData = [
    {
      "name": "推荐",
      "banner":
          "https://yanxuan.nosdn.127.net/38b49a2863971efec7ec9b6ad3c0f96a.png",
      "list": [
        {
          "name": "好货推荐",
          "icon":
              "https://yanxuan.nosdn.127.net/14bbdfb252b4ce346b8e9d019bb5b677.png"
        },
        {
          "name": "999+好评",
          "icon":
              "https://yanxuan.nosdn.127.net/756fc45b73941c43dc2e7d84b9aa8c08.png"
        },
        {
          "name": "都在搜",
          "icon":
              "https://yanxuan.nosdn.127.net/3f09367f18fd46526b3a269f24ad2000.png"
        },
        {
          "name": "居家新气象",
          "icon":
              "https://yanxuan.nosdn.127.net/1641653d7cc08fdf2559b6385d90b231.png"
        },
        {
          "name": "清扫季",
          "icon":
              "https://yanxuan.nosdn.127.net/80e1c646844df3a46a0aa30e19b41716.png"
        },
        {
          "name": "火锅轰趴",
          "icon":
              "https://yanxuan.nosdn.127.net/10ceea25caee323abf4e5d26d74cb1d4.png"
        },
        {
          "name": "新年送爸妈",
          "icon":
              "https://yanxuan.nosdn.127.net/ae5944b93150cf17bbebc3ba850d3f55.png"
        },
        {
          "name": "新年送给他",
          "icon":
              "https://yanxuan.nosdn.127.net/2c617ed61ab4769e552912c5093ff125.png"
        },
        {
          "name": "新年送给她",
          "icon":
              "https://yanxuan.nosdn.127.net/752b97d40ee10b826d16a0d6e2ffb8e8.png"
        },
        {
          "name": "新年送孩子",
          "icon":
              "https://yanxuan.nosdn.127.net/4cb504b640d917efcccf5fe6c73f6428.png"
        },
        {
          "name": "出游攻略",
          "icon":
              "https://yanxuan.nosdn.127.net/fc8ae14f8366c7dbaed31ba14a38bad5.png"
        },
        {
          "name": "除霾好物",
          "icon":
              "https://yanxuan.nosdn.127.net/7133cb4594d6ecaeadebeeb5114b7e78.png"
        },
        {
          "name": "专属定制",
          "icon":
              "https://yanxuan.nosdn.127.net/d06244d5ba0f87501a0700792a1b1e32.png"
        },
        {
          "name": "原创设计",
          "icon":
              "https://yanxuan.nosdn.127.net/7d216dfc4a4fe792080d5c63f4a2dc6f.png"
        }
      ]
    },
    {
      "name": "餐厨",
      "banner":
          "https://yanxuan.nosdn.127.net/70e6dda08179a8df081d8a4f78b28e0a.jpg",
      "list": [
        {
          "name": "锅具",
          "icon":
              "https://yanxuan.nosdn.127.net/10a143a382aaf8b8de1f533a1d3b6760.png"
        },
        {
          "name": "清洁保鲜",
          "icon":
              "https://yanxuan.nosdn.127.net/fdec112d77ab0c5083e6b2c53531df7d.png"
        },
        {
          "name": "厨房配件",
          "icon":
              "https://yanxuan.nosdn.127.net/a2e37687f68cf5cf9b5f5a54803e6171.png"
        },
        {
          "name": "刀剪砧板",
          "icon":
              "https://yanxuan.nosdn.127.net/2783b73b3631d9c71a3c602000e393c8.png"
        },
        {
          "name": "餐具",
          "icon":
              "https://yanxuan.nosdn.127.net/9fec1d39f6753fbc727b1ff76d9c810c.png"
        },
        {
          "name": "水具杯壶",
          "icon":
              "https://yanxuan.nosdn.127.net/95237ea2c4867a7b6d21e69245316af1.png"
        },
        {
          "name": "咖啡具酒具",
          "icon":
              "https://yanxuan.nosdn.127.net/318f9ae4afc1aff32515de0f73e66f80.png"
        }
      ]
    },
    {
      "name": "洗护",
      "banner":
          "https://yanxuan.nosdn.127.net/8aa5410d9d8fe87cf4da7715531c70b3.jpg",
      "list": [
        {
          "name": "纸品湿巾",
          "icon":
              "https://yanxuan.nosdn.127.net/c0ea432f052cb2f1f21edc59233b7608.png"
        },
        {
          "name": "家庭清洁",
          "icon":
              "https://yanxuan.nosdn.127.net/5fe9493e92ad818535f948c1517d183e.png"
        },
        {
          "name": "浴室用具",
          "icon":
              "https://yanxuan.nosdn.127.net/84f850b88650df61ecc5bc3ec1466fd8.png"
        },
        {
          "name": "毛巾浴巾",
          "icon":
              "https://yanxuan.nosdn.127.net/e4e5bb81db7afa070b2ba6145f717ead.png"
        },
        {
          "name": "美妆",
          "icon":
              "https://yanxuan.nosdn.127.net/2db8e5ce7ea802122843b071d124a711.png"
        },
        {
          "name": "香水香氛",
          "icon":
              "https://yanxuan.nosdn.127.net/1ab20eadf2965962b76f567465b9eda7.png"
        },
        {
          "name": "口腔护理",
          "icon":
              "https://yanxuan.nosdn.127.net/a92adb8489e22123c76e4868828373ed.png"
        },
        {
          "name": "身体护理",
          "icon":
              "https://yanxuan.nosdn.127.net/7ef2cb04dd173ae0905d451679727bd0.png"
        },
        {
          "name": "洗发护发",
          "icon":
              "https://yanxuan.nosdn.127.net/1e9c9f3b26824431c21793ce8e64df04.png"
        },
        {
          "name": "女性用品",
          "icon":
              "https://yanxuan.nosdn.127.net/701ef1375da3f6d99368f4599afdcdf2.png"
        }
      ]
    },
    {
      "name": "居家",
      "banner":
          "https://yanxuan.nosdn.127.net/4885db0f06d2801a1823b34ed08d789f.jpg",
      "list": [
        {
          "name": "床品件套",
          "icon":
              "https://yanxuan.nosdn.127.net/65a7ae2867d891a241dd8291a9037c84.png"
        },
        {
          "name": "被枕",
          "icon":
              "https://yanxuan.nosdn.127.net/cc507ff0ce7cafc1012885a01fb1942a.png"
        },
        {
          "name": "家具",
          "icon":
              "https://yanxuan.nosdn.127.net/4628932649a190c464d138c9236591fa.png"
        },
        {
          "name": "灯具",
          "icon":
              "https://yanxuan.nosdn.127.net/d04070745e3e6b7588aba519d48ad9d6.png"
        },
        {
          "name": "布艺软装",
          "icon":
              "https://yanxuan.nosdn.127.net/dd9cd8d2dae44d4319ab21919021435b.png"
        },
        {
          "name": "家饰",
          "icon":
              "https://yanxuan.nosdn.127.net/567f5588c5c86eeca8c94413d7c45e47.png"
        },
        {
          "name": "收纳",
          "icon":
              "https://yanxuan.nosdn.127.net/c8af5398744d2ed87d2459ec3d29d83e.png"
        },
        {
          "name": "旅行用品",
          "icon":
              "https://yanxuan.nosdn.127.net/09f2f2e348111984dd2c65dd8bcbf5d8.png"
        },
        {
          "name": "晾晒除味",
          "icon":
              "https://yanxuan.nosdn.127.net/0001332cb0db9939076f56c1dddbad26.png"
        }
      ]
    },
    {
      "name": "家电",
      "banner":
          "https://yanxuan.nosdn.127.net/57b6c260263d6e716ab7ed13e935fc8e.jpg",
      "list": [
        {
          "name": "生活电器",
          "icon":
              "https://yanxuan.nosdn.127.net/94a9785d8193bb4883a363be01d80ad5.png"
        },
        {
          "name": "厨房电器",
          "icon":
              "https://yanxuan.nosdn.127.net/adb063a460997674061bfdeda9d6b811.png"
        },
        {
          "name": "个护健康",
          "icon":
              "https://yanxuan.nosdn.127.net/0aaec6f7f14844e9f2286e0b0dadc1d4.png"
        },
        {
          "name": "数码",
          "icon":
              "https://yanxuan.nosdn.127.net/f78786f5aec13e9b4cb3615fb3690a58.png"
        },
        {
          "name": "影音娱乐",
          "icon":
              "https://yanxuan.nosdn.127.net/d8ff158e5e3cfe6d38fed41418864ec5.png"
        }
      ]
    },
    {
      "name": "数码",
      "banner":
          "https://yanxuan.nosdn.127.net/fd0e88792d85ea81d7a764cc50cf3b03.jpg",
      "list": [
        {
          "name": "行李箱",
          "icon":
              "https://yanxuan.nosdn.127.net/5efcbeecb663e629c1bb309c7b356f60.png"
        },
        {
          "name": "女士包袋",
          "icon":
              "https://yanxuan.nosdn.127.net/f968b48c45f29fc1a15b6cff7f92368d.png"
        },
        {
          "name": "男士包袋",
          "icon":
              "https://yanxuan.nosdn.127.net/17cbeab4e5e47ef2b5fa0f2adce6cbc2.png"
        },
        {
          "name": "钱包及小皮件",
          "icon":
              "https://yanxuan.nosdn.127.net/cf035e09fe2fae909e5d378ccd396e56.png"
        },
        {
          "name": "女鞋",
          "icon":
              "https://yanxuan.nosdn.127.net/53dd392169abf4984ee5daec84510826.png"
        },
        {
          "name": "男鞋",
          "icon":
              "https://yanxuan.nosdn.127.net/14e2582977d60e58da4e77ec40e41b32.png"
        },
        {
          "name": "拖鞋",
          "icon":
              "https://yanxuan.nosdn.127.net/1f22276749f73010ae94ae6b8960d201.png"
        },
        {
          "name": "鞋配",
          "icon":
              "https://yanxuan.nosdn.127.net/6571b20f095e92deaf4b3f0e159b6479.png"
        },
        {
          "name": "围巾件套",
          "icon":
              "https://yanxuan.nosdn.127.net/373d0f37118a3eb62b58cadaba6e4657.png"
        },
        {
          "name": "袜子",
          "icon":
              "https://yanxuan.nosdn.127.net/cea9714c0df2b60cdad542cf7f6c0e7e.png"
        },
        {
          "name": "丝袜",
          "icon":
              "https://yanxuan.nosdn.127.net/be661ded0f2bd0f3cc21bd4b2c4dbb9f.png"
        },
        {
          "name": "首饰",
          "icon":
              "https://yanxuan.nosdn.127.net/5d189289a6623c6ae43701c1ce3f1542.png"
        },
        {
          "name": "配件",
          "icon":
              "https://yanxuan.nosdn.127.net/d862cec3c88eb0619202cab232992809.png"
        },
        {
          "name": "眼镜",
          "icon":
              "https://yanxuan.nosdn.127.net/1d653f706fb834937a3d1c29e5725618.png"
        }
      ]
    },
    {
      "name": "美妆",
      "banner":
          "https://yanxuan.nosdn.127.net/44edf688340235bffd1ab037b3737874.jpg",
      "list": [
        {
          "name": "男式外套",
          "icon":
              "https://yanxuan.nosdn.127.net/1f44908a54d0a855d376d599372738d4.png"
        },
        {
          "name": "针织衫/卫衣",
          "icon":
              "https://yanxuan.nosdn.127.net/5d343169a0259a857591d11498dcc3c6.png"
        },
        {
          "name": "男式裤装",
          "icon":
              "https://yanxuan.nosdn.127.net/0db932c899b45c0260f00cbfb195e46c.png"
        },
        {
          "name": "男式牛仔",
          "icon":
              "https://yanxuan.nosdn.127.net/5caca392597f8b0ab3103e02e916250e.png"
        },
        {
          "name": "男式衬衫",
          "icon":
              "https://yanxuan.nosdn.127.net/883ddd00354e359359a63847ba5d2395.png"
        },
        {
          "name": "男式T恤/POLO",
          "icon":
              "https://yanxuan.nosdn.127.net/fada7f7b322eea4ba484fcc6175ad720.png"
        },
        {
          "name": "女式外套",
          "icon":
              "https://yanxuan.nosdn.127.net/86c3f81ba73ed80f32b19eafa10a49e9.png"
        },
        {
          "name": "女式针织衫/卫衣",
          "icon":
              "https://yanxuan.nosdn.127.net/c835be53f593dbbd1d31957f83465828.png"
        },
        {
          "name": "女式裤装",
          "icon":
              "https://yanxuan.nosdn.127.net/285478d84397b7bdc4bc7b46faa856da.png"
        },
        {
          "name": "女式牛仔",
          "icon":
              "https://yanxuan.nosdn.127.net/a3b03ac46eee056d1642c548bf1b4021.png"
        },
        {
          "name": "女式裙装",
          "icon":
              "https://yanxuan.nosdn.127.net/a60f2c44aae43b982cb2ffb2a961b331.png"
        },
        {
          "name": "女式T恤/POLO",
          "icon":
              "https://yanxuan.nosdn.127.net/9a8fb3ac449cda8e1ae64840ee137a5e.png"
        },
        {
          "name": "女式衬衫",
          "icon":
              "https://yanxuan.nosdn.127.net/6fa4dfdb7e036df499217be61327e1a0.png"
        },
        {
          "name": "男式运动上装",
          "icon":
              "https://yanxuan.nosdn.127.net/87e3129e372b7ebf73767f10be8a15a2.png"
        },
        {
          "name": "女式运动上装",
          "icon":
              "https://yanxuan.nosdn.127.net/c88fac329a5562d3ef40a5a0a1612e27.png"
        },
        {
          "name": "男式运动下装",
          "icon":
              "https://yanxuan.nosdn.127.net/a1a82637fc8e1ab9eafdd7ae3eec4d4f.png"
        },
        {
          "name": "运动下装",
          "icon":
              "https://yanxuan.nosdn.127.net/4088b6af21f8174909d62084848ef198.png"
        },
        {
          "name": "男式户外",
          "icon":
              "https://yanxuan.nosdn.127.net/76b81baf198ba4b682d31905f39e0265.png"
        },
        {
          "name": "女式户外",
          "icon":
              "https://yanxuan.nosdn.127.net/f973a931032734095cf7465245e77ec1.png"
        },
        {
          "name": "男家居服",
          "icon":
              "https://yanxuan.nosdn.127.net/3ee1a7cc33a6ffe0f30b526a438a592f.png"
        },
        {
          "name": "女家居服",
          "icon":
              "https://yanxuan.nosdn.127.net/3f34c856b84d075920543deca4615e7c.png"
        },
        {
          "name": "男式内裤",
          "icon":
              "https://yanxuan.nosdn.127.net/fe6f52c6d2644e4da385d42c4a77d558.png"
        },
        {
          "name": "女式内裤",
          "icon":
              "https://yanxuan.nosdn.127.net/f2283e51a6aef86b38c8c97ea28a03ae.png"
        },
        {
          "name": "女式内衣",
          "icon":
              "https://yanxuan.nosdn.127.net/51284dd9a3773f522716ae1c95344ed2.png"
        },
        {
          "name": "男式内衣",
          "icon":
              "https://yanxuan.nosdn.127.net/8ecd72cca1d34fde7fb5ec382b87925f.png"
        },
        {
          "name": "Yessing上装",
          "icon":
              "https://yanxuan.nosdn.127.net/52b47f2b4ecf51e7f21aa7bfb590af54.png"
        },
        {
          "name": "Yessing下装",
          "icon":
              "https://yanxuan.nosdn.127.net/84c5cc995f15153d2f92916e4828c0e1.png"
        }
      ]
    },
    {
      "name": "数码家电",
      "banner":
          "https://yanxuan.nosdn.127.net/44edf688340235bffd1ab037b3737874.jpg",
      "list":[]
    },
     {
      "name": "数码家电",
      "banner":
          "https://yanxuan.nosdn.127.net/44edf688340235bffd1ab037b3737874.jpg",
      "list":[]
    },
     {
      "name": "数码家电",
      "banner":
          "https://yanxuan.nosdn.127.net/44edf688340235bffd1ab037b3737874.jpg",
      "list":[]
    },
     {
      "name": "数码家电",
      "banner":
          "https://yanxuan.nosdn.127.net/44edf688340235bffd1ab037b3737874.jpg",
      "list":[]
    },
     {
      "name": "数码家电",
      "banner":
          "https://yanxuan.nosdn.127.net/44edf688340235bffd1ab037b3737874.jpg",
      "list":[]
    },
     {
      "name": "数码家电",
      "banner":
          "https://yanxuan.nosdn.127.net/44edf688340235bffd1ab037b3737874.jpg",
      "list":[]
    }
  ];
}
