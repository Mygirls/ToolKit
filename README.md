# ToolKit


这是一个简单的工具类

*****************************
*****************************
本工具类支持cocopods，
只需导入：

pod 'MToolKit', '~> 0.0.1'

即可
*****************************
*****************************


这里面涉及到NSString、NSDate、NSCalendar、NSDateComponents

对其进行封装，
对字符串进行 MD5 加密、base64 编码解码，时间格式的转换，以及正则表达式的处理

对控件也进行了一些处理；
//通过响应者链来获取view 所在的控制器对象
- (UIViewController *)m_viewController;

/**
 *  根据颜色color 来生成纯色图片
 *
 *  @param color 颜色
 *  @param size 尺寸
 *  @return UIImage
 */
+ (UIImage *)m_imageWithColor:(UIColor *)color size:(CGSize)size;


/**
 *  根据颜色color 来生成纯色图片,带文本
 *
 *  @param color 颜色
 *  @param size 尺寸
 *  @param text 文本
 *  @param point 文本位置
 *  @return UIImage
 */
+ (UIImage *)m_imageWithColor:(UIColor *)color size:(CGSize)size text:(NSString *)text textPoint:(CGPoint)point;

//MARK: - 颜色
/**
 *  获取指定位置的颜色
 *
 *  @param point 位置CGPoint
 *  @return UIColor
 */
- (UIColor *)m_colorAtPoint:(CGPoint)point;


/// 是否含有透明通道，如含有就返回TRUE
- (BOOL)m_hasAlpha;

/// 如果不存在透明通道就添加透明通道并返回结果
- (UIImage *)m_setImageAlpha;

/**
 生成缩略图

 @param image 原始图片
 @param size 生成缩略图的size
 @return UIImage
 */
+ (UIImage *)m_imageWithOriginImage:(UIImage *)image size:(CGSize)size;

//MARK: - 截图、截屏
/// 截屏
+ (UIImage *)m_imageOfCaptureScreen;

/**
 *  从给定UIView中截图：UIView转UIImage
 *
 *  @param view 指定的view
 *  @return UIImage
 */
+ (UIImage *)m_imageOfCaptureFromView:(UIView *)view;

/**
 *  从给定UIView中截图指定的部分
 *
 *  @param view 指定的view
 *  @param rect 截图的CGRect
 *  @return UIImage
 */
+ (UIImage *)m_imageOfCaptureFromView:(UIView *)view rect:(CGRect)rect;

/**
 *  从给定UIImage和指定Frame截图：
 *
 *  @param frame 指定Frame
 *  @return UIImage
 */
- (UIImage *)m_imageOfcaptureWithFrame:(CGRect)frame;






















