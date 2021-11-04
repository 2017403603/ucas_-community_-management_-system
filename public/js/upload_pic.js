$list = $("#upload_pic");
state = "pending";
var uploader = WebUploader.create({
    // swf文件路径
    swf: '/js/Uploader.swf',
    // 文件接收服务端。
    server: '/admin/societies/upload',
    chunked: true,
    chunkSize:2*1024*1024,
    fileSizeLimit: 4*1024*1024,//限制大小4M，所有被选文件，超出选择不上
    // 选择文件的按钮。可选。
    // 内部根据当前运行是创建，可能是input元素，也可能是flash.
    pick: '#upload_pic',
    // 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
    resize: false,
    // 只允许选择图片文件。
    accept: {
        title: 'Images',
        extensions: 'gif,jpg,jpeg,bmp,png',
        mimeTypes: 'image/*'
    }
});
// 当有文件被添加进队列的时候
uploader.on( 'fileQueued', function( file ) {
    $img = $list.find('img');
    // 创建缩略图
    // thumbnailWidth x thumbnailHeight 为 80 x 80
    thumbnailWidth = 80;
    thumbnailHeight = 80;
    uploader.makeThumb( file, function( error, src ) {
        if ( error ) {
            $img.replaceWith('<span>不能预览</span>');
            return;
        }
        $img.attr( 'src', src );
        $('p.state').html('等待上传...');
    }, thumbnailWidth, thumbnailHeight );
    // 出发上传文件
    uploader.upload();
});
uploader.on('uploadAccept', function (file, data) {
    if(data.code != 200) {
        return false;
    }
    $('input[name=random_name]').val(data.data.random_name);
});
uploader.on( 'uploadProgress', function( file, percentage ) {
    $('p.state').html('正在上传...');
});
uploader.on( 'uploadSuccess', function( file ) {
    $('p.state').html('已上传');
});
uploader.on( 'uploadError', function( file) {
    $('p.state').html('上传出错');
});
uploader.on("error",function (type) {
    if (type == "F_DUPLICATE") {
        alert("请不要重复选择文件！");
    } else if (type == "Q_EXCEED_SIZE_LIMIT") {
        alert("文件大小不能超过4m" );
    }
});