(function (global) {
    var isSliding = false;

    var demo = global.demo = {
        sliderClientValueChanging: function (sender, args) {
            // Show the tooltip only while the slider handle is sliding. In case the user simply clicks on the track of the slider to change the value
            // the change will be quick and the tooltip will show and hide too quickly.
            if (!isSliding) {
                return;
            }

            var tooltip = getToolTip();
            resetToolTipLocation(tooltip);
            tooltip.set_text(args.get_newValue());
        },

        sliderClientSlideStart: function (sender, args) {
            isSliding = true;

            var tooltip = getToolTip();
            showRadToolTip(tooltip, sender);
        },

        sliderClientSlideEnd: function (sender, args) {
            isSliding = false;

            var tooltip = getToolTip();
            tooltip.hide();
        }
    };

    function showRadToolTip(tooltip, slider) {
        var activeHandle = slider.get_activeHandle();
        if (!activeHandle) {
            return;
        }

        tooltip.set_targetControl(activeHandle);
        resetToolTipLocation(tooltip);
    }

    function resetToolTipLocation(tooltip) {
        if (!tooltip.isVisible()) {
            tooltip.show();
        }
        else {
            tooltip.updateLocation();
        }
    }

})(window);