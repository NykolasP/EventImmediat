from django import template
from django.utils import timezone

register = template.Library()

@register.filter
def filter_date(queryset, lookup):
    if lookup == "gte":
        return queryset.filter(date_event__gte=timezone.now())
    elif lookup == "lt":
        return queryset.filter(date_event__lt=timezone.now())
    return queryset
