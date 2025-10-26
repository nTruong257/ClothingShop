
async function loadLayout() {
    try {
        const response = await fetch('../../index.html');
        const htmlText = await response.text();

        const parser = new DOMParser();
        const doc = parser.parseFromString(htmlText, 'text/html');

        const header = doc.querySelector('header.site-header');
        const footer = doc.querySelector('footer.site-footer');

        const headerContainer = document.getElementById('header');
        const footerContainer = document.getElementById('footer');

        if (header && headerContainer) {
            headerContainer.innerHTML = header.outerHTML;
            ImagePaths(headerContainer);
            NavigationLinks(headerContainer);
        }

        if (footer && footerContainer) {
            footerContainer.innerHTML = footer.outerHTML;
            ImagePaths(footerContainer);
            NavigationLinks(footerContainer);
        }

    } catch (error) {
        console.error('Lỗi khi tải header/footer:', error);
    }
}

// Display Contact Us page
loadLayout();

function ImagePaths(container) {
    const images = container.querySelectorAll('img');
    images.forEach(img => {
        const src = img.getAttribute('src');
        if (src && src.startsWith('images/')) {
            img.setAttribute('src', '../../' + src);
        }
    });
}

function NavigationLinks(container) {
    const links = container.querySelectorAll('a');
    links.forEach(link => {
        const href = link.getAttribute('href');
        if (href === '/') {
            link.setAttribute('href', '../../index.html');
        }
        else if (href && href.startsWith('/collections/')) {
            link.setAttribute('href', '../../' + href.substring(1));
        }
        else if (href && href.startsWith('/pages/')) {
            link.setAttribute('href', '../' + href.substring(1));
        }
        else if (href && href.startsWith('/') && !href.startsWith('//')) {
            link.setAttribute('href', '../../' + href.substring(1));
        }
        else if (href && (href.includes('contactus.html') || href.includes('contact-us'))) {
            link.setAttribute('href', '#');
            link.style.color = '#3498db';
            link.style.fontWeight = '700';
        }
    });
}
