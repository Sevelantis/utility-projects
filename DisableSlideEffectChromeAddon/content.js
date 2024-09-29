(function() {
    // Override jQuery slide methods
    if (window.jQuery) {
        jQuery.fn.slideDown = jQuery.fn.slideUp = jQuery.fn.slideToggle = function() {
            return this;
        };
    }

    // Disable CSS transitions and animations
    const css = `
        * {
            transition: none !important;
            animation: none !important;
        }
    `;
    
    const style = document.createElement('style');
    style.type = 'text/css';
    style.appendChild(document.createTextNode(css));
    document.head.appendChild(style);
})();
