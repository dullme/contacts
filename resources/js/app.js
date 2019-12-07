// window.axios = require('axios');
//
// window.axios.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest';
//
// let token = document.head.querySelector('meta[name="csrf-token"]');
//
// if (token) {
//     window.axios.defaults.headers.common['X-CSRF-TOKEN'] = token.content;
// } else {
//     console.error('CSRF token not found: https://laravel.com/docs/csrf#csrf-x-csrf-token');
// }

setTimer ()

function setTimer () {

    $.ajax({url:"/admin/asd",success:function(res){
        console.log(res)
            if(res.complaint >0){
                document.getElementById('audio').play();
                toastr.success('有'+res.complaint + '条投诉待处理');
            }
            if(res.deposit >0){
                document.getElementById('audio').play();
                toastr.success('有'+res.deposit + '条保证金充值待处理');
            }
            if(res.withdraw >0){
                document.getElementById('audio').play();
                toastr.success('有'+res.withdraw + '条保证金提现待处理');
            }
            setTimeout(function () {
                setTimer();
            }, 60000)
        }});

    // axios.get('/admin/asd')
    //     .then((res) => {
    //         if(res.data.complaint >0){
    //             document.getElementById('audio').play();
    //             toastr.success('有'+res.data.complaint + '条投诉待处理');
    //         }
    //         if(res.data.deposit >0){
    //             document.getElementById('audio').play();
    //             toastr.success('有'+res.data.deposit + '条保证金充值待处理');
    //         }
    //         if(res.data.withdraw >0){
    //             document.getElementById('audio').play();
    //             toastr.success('有'+res.data.withdraw + '条保证金提现待处理');
    //         }
    //         setTimeout(function () {
    //             setTimer();
    //         }, 60000)
    //     })
    //     .catch((error) => {
    //         setTimeout(function () {
    //             setTimer();
    //         }, 1000)
    //     });
}

