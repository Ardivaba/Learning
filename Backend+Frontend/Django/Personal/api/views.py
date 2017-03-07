from django.shortcuts import render
from django.http import JsonResponse
from django.http import HttpResponse
from django.core import serializers
from django.views.decorators.csrf import csrf_exempt
from .models import Memo
import json

def memos(request):
    return HttpResponse(serializers.serialize("json", Memo.objects.all()))

def memos_id(request, id):
    return HttpResponse(serializers.serialize("json", Memo.objects.filter(pk = id)))

@csrf_exempt
def memos_create(request):
    category = request.POST.get("category")
    title = request.POST.get("title")
    content = request.POST.get("content")
    tasks = request.POST.get("tasks")
    images = request.POST.get("images")

    success = False
    error = False

    errors = []

    if content == None:
        errors.append("Missing POST parameter: content")
        return JsonResponse({ "success": success, "error": True, "errors": errors})

    if not error:
        memo = Memo(content = content)
        memo.save()
        success = True

    if len(errors) > 0:
        error = True

    return JsonResponse({ "success": success, "error": error, "errors": errors})

@csrf_exempt
def memos_delete(request):
    id = request.POST.get("id")

    success = False
    error = False

    errors = []

    if id == None:
        errors.append("Missing POST parameter: id")
        return JsonResponse({ "success": success, "error": True, "errors": errors})

    if not error:
        try:
            instance = Memo.objects.get(id=id)
            instance.delete()
            success = True
        except:
            errors.append("Missing memo with id: " + id)

    if len(errors) > 0:
        error = True

    return JsonResponse({ "success": success, "error": error, "errors": errors})

@csrf_exempt
def memos_update(request):
    id = request.POST.get("id")

    category = request.POST.get("category")
    title = request.POST.get("title")
    content = request.POST.get("content")
    tasks = request.POST.get("tasks")
    images = request.POST.get("images")

    data = gather(request, [
        ["id", "POST", "int", 250, "required"],
        ["category", "POST", "string", 250],
        ["title", "POST", "string", 250],
        ["content", "POST", "text"],
        ["tasks", "POST", "text"],
        ["images", "POST", "string", 250]
    ])

    success = False
    error = False

    errors = []

    if id == None:
        errors.append("Missing POST parameter: id")
        return JsonResponse({ "success": success, "error": True, "errors": errors})

    instance = None
    try:
        instance = Memo.objects.get(id=id)
    except:
        errors.append("Missing memo with id: " + id)

    if not category == None and not instance == None:
        instance.category = category

    if not title == None and not instance == None:
        instance.title = title

    if not content == None and not instance == None:
        instance.content = content

    if not tasks == None and not instance == None:
        instance.tasks = tasks

    if not images == None and not instance == None:
        instance.images = images

    if len(errors) > 0:
        error = True
    else:
        instance.save()
        success = True

    return JsonResponse({ "success": success, "error": error, "errors": errors})

def gather(request, data_request):
    for dr in data_request:
        name = dr[0]
        from_ = dr[1]
        
