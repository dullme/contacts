<div class="box box-info">
    <div class="box-header with-border">
        <h3 class="box-title">修改</h3>

        <div class="box-tools">
            <div class="btn-group pull-right" style="margin-right: 5px">
                <a href="{{ url('/admin/invitation-users') }}" class="btn btn-sm btn-default" title="列表"><i class="fa fa-list"></i><span class="hidden-xs">&nbsp;列表</span></a>
            </div>
        </div>
    </div>
    <!-- /.box-header -->
    <!-- form start -->
    <form accept-charset="UTF-8" class="form-horizontal">

        <div class="box-body">
            <div class="fields-group">
                <div class="form-group  ">
                    <label for="validity_period" class="col-sm-2  control-label">添加邀请码</label>
                    <div class="col-sm-2" style="display: inline-flex">
                        <div class="input-group">
                            <input style="width: 150px; text-align: center;" type="text" id="add_validity_period" name="add_validity_period" value="1" class="form-control validity_period initialized" placeholder="添加邀请码">
                        </div>
                        <a id="check-expiration" onclick="checkaddDays()" style="margin-left: 10px" class="btn btn-default" >添加</a>
                    </div>
                    <div style="clear: both"></div>
                    <label style="margin-left: 224px;margin-top: 40px" class="control-label" for="inputError"><span id="check-add-days-message" style="color: #dd4b39"></span></label>

                </div>
            </div>
        </div>
    </form>
</div>

<script>
    var lock = true;
    function checkaddDays() {
        $('#check-add-days-message').html("");
        var add_validity_period = $('#add_validity_period').val();
        if(add_validity_period == '' || add_validity_period == 0){
            $('#check-add-days-message').html("增加个数不能为空或0！");
            return false;
        }

        if(add_validity_period > 200){
            $('#check-add-days-message').html("一次只能增加200个邀请码！");
            return false;
        }

        if(lock){
            if (window.confirm("确定新增？")) {
                this.lock = false;
                $('#check-add-days-message').html('添加中... ...');
                axios.post('/admin/add-users', {
                    count: add_validity_period,
                })
                    .then(function (response) {
                        if(response.data.status){
                            $('#check-add-days-message').html('<span style="color:#3c763d">'+response.data.message+'</span>');
                        }else{
                            $('#check-add-days-message').html(response.data.message);
                        }
                        this.lock = true;
                    })
                    .catch(function (error) {
                        $('#check-add-days-message').html(error.response.data.message);
                        this.lock = true;
                    });
            } else {
                return false;
            }
        }else{
            alert('请等待添加完成！');
        }


    }
</script>
