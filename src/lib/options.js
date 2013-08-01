
$(function(){
    var WhoView=Backbone.View.extend({
        el: $('#who-form')
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
            this.$("#name").val( this.model.get('name') );
        }
        , updateViewJumin1: function() {
            this.$("#jumin1").val( this.model.get('jumin1') );
        }
        , updateViewJumin2: function() {
            this.$("#jumin2").val( this.model.get('jumin2') );
        }
        , events: {
            'change #name': 'changeName'
            , 'change #jumin1': 'changeJumin1'
            , 'change #jumin2': 'changeJumin2'
        }
        , changeName: function() {
            this.model.set( { name: this.$('#name').val() } );
            this.model.save();
        }
        , changeJumin1: function(){
            this.model.set( { jumin1: this.$('#jumin1').val() } );
            this.model.save();
        }
        , changeJumin2: function(){
            this.model.set( { jumin2: this.$('#jumin2').val() } );
            this.model.save();
        }
    })

    var who= new Who({id:'who'});

    Backbone.sync('read', who, {
        success: function(data) {
            who.set('name', data.name);
            who.set('jumin1', data.jumin1);
            who.set('jumin2', data.jumin2);
        }
        , error: function(msg) {
            //ignoring record not found
            //alert( msg );
        }
    });

    var whoView = new WhoView({model: who});
    whoView.render();
})