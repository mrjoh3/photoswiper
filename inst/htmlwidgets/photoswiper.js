
HTMLWidgets.widget({

  name: 'psr',

  type: 'output',

  factory: function(el, width, height) {



    return {

      renderValue: function(x) {

          el.innerText = x.message;

          x.bindto = '#' + el.id;

          var pswpElement = document.querySelectorAll('.pswp')[0];

          // define options (if needed)
          var options = {
              // optionName: 'option value'
              // for example:
              index: 0 // start at first slide
          };

          var slides = HTMLWidgets.dataframeToD3(x.slides);

          var gallery = new PhotoSwipe(pswpElement, PhotoSwipeUI_Default, slides, options);

          gallery.init();


      },

      resize: function(width, height) {

      }

    };

  }
});
