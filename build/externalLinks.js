    /*  http://www.sitepoint.com/article/standards-compliant-world

        Modified by John Walker to only extract and modify links with
        rel="Target:<frame>" and extract the frame name from that
        specification. */

    'use strict';

    function externalLinks() {
        if (!document.getElementsByTagName) {
            return;
        }
        var anchors = document.getElementsByTagName("a");
        for (var i = 0; i < anchors.length; i++) {
            var anchor = anchors[i], target;
            if (anchor.getAttribute("href") &&
                anchor.getAttribute("rel") &&
                anchor.getAttribute("rel").match(/^Target:/)) {
                target = anchor.getAttribute("rel").match(/(^Target:)(\w+$)/);
                anchor.target = target[2];
            }
        }
    }
