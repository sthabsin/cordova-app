    var Router = {
        root: '#/',
        routes: [],
        urls: [],
        titles: [],
        add: function(thePath, theUrl, theTitle) {
            this.routes.push(thePath);
            this.urls.push(theUrl);
            this.titles.push(theTitle);
            $('#js-nav').append('<li class="nav-item"><a onclick="toggleMenu()" href="' + thePath + '">' + theTitle + '</a></li>')
        },
        navigate: function() {
            var routes = this.routes,
                urls = this.urls,
                root = this.root,
                titles = this.titles;

            function loading() {
                var a = $.inArray(location.hash, routes),
                    template = urls[a];
                $('#js-title').text(titles[a]);
                if (a === -1) {
                    location.hash = root;
                    $('#js-view').load(urls[0]);
                } else {
                    $('#js-view').load(template);
                    if (a === 0) {
                        window.scrollTo(0, 0);
                    } else {
                        window.scrollTo(0, 90);
                    }
                }
            }
            window.onload = loading;
            window.onhashchange = loading;
        }
    };
    ///nav-start
///nav-end
    Router.navigate();
