(function() {
    var WhoView=Backbone.View.extend({
        el: $('.login')
        , initialize: function() {
            this.model.on('change:name', this.updateViewName, this);
            this.model.on('change:jumin1', this.updateViewJumin1, this);
            this.model.on('change:jumin2', this.updateViewJumin2, this);
        }
        , render: function() {
            this.updateViewName();
            this.updateViewJumin1();
            this.updateViewJumin2();
        }
        , updateViewName: function() {
            // this.$('selector') == $('selector', this.el);
            this.$("#userNm").val( this.model.get('name') );
        }
        , updateViewJumin1: function() {
            this.$("#userNo1").val( this.model.get('jumin1') );
        }
        , updateViewJumin2: function() {
            this.$("#userNo2").val( this.model.get('jumin2') );
        }
    })

    var who= new Who( { id:'who' } );
    var whoView=new WhoView({model: who});
    whoView.render();

    //Backgound 페이지와 객체를 주고 받을 때 serialize & deserialized 되는 것 같음
    //Backbone Model을 넘겨도 serialize되기 때문에 Model 객체 자체가 넘어가지 않고
    //프로퍼티만 추출되서 넘어감.
    chrome.extension.sendRequest({id: who.get('id') }, function(resp){
        if( !resp || (resp.hasOwnProperty('data') && !resp.data ) ) {
            return;
        }

        who.set( resp.data );
    });

    var newElement = document.createElement("script");
    newElement.src = chrome.extension.getURL('walker.js');
    newElement.charset = 'utf-8';
    document.body.appendChild(newElement);

})();
