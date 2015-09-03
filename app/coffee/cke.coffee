window.CKEDITORCONFIG =
  contentsCss: "../vendor/cke.css"
  height: 350
  stylesSet: [
    # Block-level styles.
    { name: 'Block', element: 'div', attributes: {'class': 'block-clearfix'}},
    { name: 'Title', element: 'div', attributes: {'class': 'article-title'}},
    { name: 'Author/date', element: 'div', attributes: {'class': 'article-author'}},

    { name: 'Annotate', element: 'div', attributes: {'class': 'article-annotate'}},
    { name: 'Incstruction', element: 'div', attributes: {'class': 'article-incstruction'}},

    { name: 'Anchors', element: 'ul', attributes: {'class': 'article-anchors'}},
    { name: 'Read Also', element: 'ul', attributes: {'class': 'article-read-also'}},

    { name: 'Img left', element: 'img', attributes: {'class': 'article-img-left'}},
    { name: 'Img right', element: 'img', attributes: {'class': 'article-img-right'}},

    { name: 'Img sign', element: 'div', attributes: {'class': 'article-img-sign'}},
    { name: 'Img sign left', element: 'div', attributes: {'class': 'article-img-sign-left'}},
    { name: 'Img sign right', element: 'div', attributes: {'class': 'article-img-sign-right'}},

    { name: 'Subheader 1', element: 'div', attributes: {'class': 'article-sh1'}},
    { name: 'Subheader 2', element: 'div', attributes: {'class': 'article-sh2'}},
    { name: 'Subheader 3', element: 'div', attributes: {'class': 'article-sh3'}},
    { name: 'Subheader 4', element: 'div', attributes: {'class': 'article-sh4'}},

    { name: 'Quote', element: 'div', attributes: {'class': 'article-quote'}},

    # Inline styles.
    { name: 'Button', element: 'a', attributes: { 'class': 'article-btn' } },
    { name: 'Quote author name', element: 'span', attributes: { 'class': 'article-quote-author-name' } },
    { name: 'Quote author profession', element: 'span', attributes: { 'class': 'article-quote-author-prof' } },
    # { name: 'Marker: Yellow', element: 'span', styles: { 'background-color': 'Yellow' } }
  ]
  format_tags: 'h1;h2;h3;h4;h5;div;p'
