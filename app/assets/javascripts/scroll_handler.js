var ScrollHandler //singleton constructor

(function () {
  var instance
  ScrollHandler = function () {
    if (typeof instance !== 'undefined') {
      return instance
    }

    //Calculates index of active element
    var getActiveIndex = function () {
      var linksToGalleries = $('.link-to-gallery')
      var activeLink = $('.active-g')
      var ids = []
      $.each(linksToGalleries, function(i) { ids.push(linksToGalleries[i].id) })
      return ids.indexOf(activeLink.attr('id'))
    }
    //Calculates margin that should have element at the target index
    var getMarginForIndex = function (index) {
      var linksToGalleries = $('.link-to-gallery')
      var block = index != 0 ? $(linksToGalleries[0]) : $(linksToGalleries[1])
      var newMargin = -totalHeight( block.parent() ) * (index)
      return newMargin
    }
    //Moves sidebar to 
    var scrollSidebar = function (toMargin) {
      $('.side-bar .inner').animate({ 'margin-top': toMargin }, 200)
    }

    var scrollToIndex = function (toIndex) {
      var newMargin = getMarginForIndex(toIndex)
      scrollSidebar(newMargin)
    }

    var nextIndex = function (index) {
      return index == $('.link-to-gallery').length - 1 ? 0 : index + 1
    }

    var prevIndex = function (index) {
      return index == 0 ? $('.link-to-gallery').length - 1 : index - 1
    }

    this.up = function () {
      self.activeIndex = prevIndex(self.activeIndex)
      scrollToIndex(self.activeIndex)
    }

    this.down = function () {
      self.activeIndex = nextIndex(self.activeIndex)
      scrollToIndex(self.activeIndex)
    }

    this.toActive = function () {
      self.activeIndex = getActiveIndex()
      scrollToIndex(self.activeIndex)
    }

    var self = this
    this.activeIndex = getActiveIndex()
    this.mouseUp = false

    return instance = this

  }
})()
