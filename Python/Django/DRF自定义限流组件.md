
> 非按照xx次请求/每时刻的需求，而是按照业务需求调整，例如，每天只能检测100张图片


```python
# settins.py
非全局，未配置DRP相关的配置

# 缓存配置
CACHES = {
    "default": {
        "BACKEND": "django.core.cache.backends.locmem.LocMemCache",
    }
}

```

```python
# views.py
from application.throttles import RoleDayLimitUserRateThrottle


class DetectResultViewSet(viewsets.ModelViewSet):
    queryset = DetectResult.objects.all()
    serializer_class = DetectResultSerializer
    throttle_scope = 'role_day_limit'
    throttle_classes = [RoleDayLimitUserRateThrottle]  # 启用限流

	...

```

```python
# application/throttles.py

from rest_framework.throttling import SimpleRateThrottle,BaseThrottle
from django.core.cache import caches

# 此处不再是原始意义上的n次每时间，而是n张图片每时间
class RoleDayLimitUserRateThrottle(SimpleRateThrottle):
    scope = 'role_day_limit'  # 作用域标识，对应settings中的DEFAULT_THROTTLE_RATES键名
    rate = "1/min"  

    def get_cache_key(self, request, view):
        """生成基于用户身份的缓存键"""
        if request.user.is_authenticated:
            ident = str(request.user.pk)
        else:
            ident = self.get_ident(request)  # 匿名用户按IP地址限流[6](@ref)
        return f"{self.scope}:{ident}"


    def allow_request(self,request,view):

        # 用户登录状态下调用
        # if request.user.is_authenticated:
        # 不需要此判断，此限流组件作用于登录后的路由，想要成功调用必定需要优先登录

        # 无需判断路由,这个限流只需要配置给detec就可以
        # print(request.path)

        # 获取用户配置的rate值，若无此配置，则默认该用户不限速
        print(111,request.user)
        try:
            user_conf_rate = request.user.userlimitconf.throttle_rate
            self.rate = user_conf_rate
            self.num_requests, self.duration = self.parse_rate(self.rate)
            print(f"动态设置rate{user_conf_rate}")
        except:
            self.rate = None

        if self.rate is None:
            return True

        self.key = self.get_cache_key(request, view)
        if self.key is None:
            return True

        self.history = self.cache.get(self.key, [])
        print(self.history)
        self.now = self.timer()


        images = request.data.get("images")
        images_num = len(images)


        # 把超过时间限制的时间戳pop
        while self.history and self.history[-1] <= self.now - self.duration:
            self.history.pop()

        # 范围内检测图片数量超过数量限制了
        if len(self.history) >= self.num_requests:
            return self.throttle_failure()

        for _ in range(images_num):
            if len(self.history) >= self.num_requests:
                # 把响应中的图片pop走一个
                x = request.data.get("images").pop()
                continue
            self.history.insert(0, self.now)
            self.cache.set(self.key, self.history, self.duration)

        return True

```