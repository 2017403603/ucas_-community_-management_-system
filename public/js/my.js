$.ajaxSetup({ headers: { 'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content') } });

//搜索回车跳转
$('#search_list').keydown(function (event) {
        if (event.keyCode == '13') {
            var url = $(this).attr('data-url');
            var search_value = $.trim($('input[name=search_key]').val());
            window.location.href = url + '?search_key=' + search_value;
        }
    }
);

// 新增 修改 获取 删除 数据
function doRequest(_this, url, type, data, callback) {
    _this = _this || $('body');
    if (data) {
        //data去除空格
        for (var key in data) {
            if ((typeof data[key] ==  'string')) {
                data[key] = $.trim(data[key])
            }
        }
    }
    $.ajax({
        url: url,
        type: type,
        dataType: 'json',
        data: data,
        beforeSend: function () {
            _this.attr('disabled',true);
            $('#load_img').show();
        },
        success: function (res) {
            _this.attr('disabled',false);
            $('#load_img').hide();
            if (res.code == 200) {
                if (callback) {
                    if (res.data) {
                        callback(res.data);
                    } else {
                        callback();
                    }
                } else if (res.message) {
                    alert(res.message);
                }
            } else {
                //判断错误信息的数据类型
                if (typeof res.errors == "string") {
                    alert(res.errors)
                } else {
                    for (var key in res.errors) {
                        alert(res.errors[key]);
                        break;
                    }
                }
            }
        },
        error: function () {
            _this.attr('disabled',false);
            $('#load_img').hide();
            alert('系统发生未知错误');
        }
    });
}

//删除一条数据
$('.delete_one').click(function () {
    if (confirm('确定删除？')) {
        var _this = $(this);
        var url = _this.attr('data-url');
        doRequest(_this,url,'DELETE',{}, function () {
            _this.parent().parent().remove();
        });
    }
    return false;
});

/**
 *
 * @param array_data 数组，元素是json
 * @param shape 要替换的html
 * @param keys  要替换的键值
 * @returns {string}
 * 返回循环的html数据
 */
function getRenderHtml(array_data, shape) {
    var html = '';
    $.each(array_data, function (i, item) {
        html += replaceShape(shape, item);
    });
    return html;
}

// 字符串替换函数，支持多个不同的字符串分别替换成不同的字符串
function replaceShape(shape, json_data) {
    for (var key in json_data) {
        shape = shape.replace('{'+key+'}', json_data[key]);
    }
    return shape;
}

// 判断是不是数组类型
function isArray(obj) {
    return Object.prototype.toString.call(obj) === '[object Array]';
}