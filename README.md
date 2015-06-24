## WebVC
UIWebView + 自定义 Request 的 Header 中添加键值对 KeyValues


### 前言 Foreword
在iOS网络开发中，有时候我们会碰到一种需求就是要求请求(Request)的Header中包含我们自定义的键值对(KeyValues)，每次请求都要这么设置。如果是正常的请求，是比较好办的，但是如果是使用UIWebView控件，就不太好办了。


### 代码(已更新) Code
* 拖拽`WebVC`文件夹到你的项目中(文件夹在Demo中可以找到);
* 根据你的需求在`WebVC.m`中添加修改你的键值对(KeyValues);
* 在你需要使用的viewController中，`#import "WebVC.h"`;
* 敲如下代码:

  ```objc
  WebVC *webVC = [[WebVC alloc] init];
  
  webVC.URLString = @"http://m.baidu.com";
  
  [self.navigationController pushViewController:webVC animated:YES];
  
  [self presentViewController:webVC animated:YES completion:nil];
  ```


### 提示 Tips 
* 不要使用两次以上的系统goBack、goForward功能，因为在UIWebView中干了一些事，扰乱了UIWebView的浏览记录。


### 联系 Support
* 发现问题请lssues我，谢谢:-)
* Email:leoios@sina.com
* Blog: http://www.leodong.com


### 授权 License
本项目采用 [MIT license](http://opensource.org/licenses/MIT) 开源，你可以利用采用该协议的代码做任何事情，只需要继续继承 MIT 协议即可。
