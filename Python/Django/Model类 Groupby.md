
```python

from django.db.models import Count

TestModel.objects.values("create_date").annotate(count=Count("user_id"))

```
