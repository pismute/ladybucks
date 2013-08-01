var Who=Backbone.Model.extend({
    defaults: {name:'', jumin1:'', jumin2:''}
    , localStorage: new Store('ladybucks')
    , validate: function(attrs){
        if( _.isNumber( attrs.jumin1 ) ){
            return 'number only';
        }

        if( _.isNumber( attrs.jumin2 ) ){
            return 'number only';
        }
    }
});