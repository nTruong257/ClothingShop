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
        initMobileMenuAfterLoad();
        initBootstrapComponents();

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
        }
    });
}

function initMobileMenuAfterLoad() {
    // Toggle Mobile Menu
    window.toggleMobileMenu = function() {
        const mainNav = document.getElementById('mainNavigation');
        if (mainNav) {
            mainNav.classList.toggle('active');
            document.body.style.overflow = mainNav.classList.contains('active') ? 'hidden' : '';
        }
    }

    const navItems = document.querySelectorAll('.nav-item');

    navItems.forEach(item => {
        const hasSubmenu = item.querySelector('.submenu-container');

        if (hasSubmenu) {
            const mainLink = item.querySelector('.nav-link-primary');

            mainLink.addEventListener('click', function(e) {
                if (window.innerWidth <= 991) {
                    e.preventDefault();
                    item.classList.toggle('active');
                }
            });
        }
    });

    document.addEventListener('click', function(event) {
        const mainNav = document.getElementById('mainNavigation');
        const toggleBtn = document.querySelector('.mobile-menu-toggle');

        if (mainNav && toggleBtn) {
            const isClickInside = mainNav.contains(event.target) || toggleBtn.contains(event.target);

            if (!isClickInside && mainNav.classList.contains('active')) {
                mainNav.classList.remove('active');
                document.body.style.overflow = '';

                // Remove active class from all nav items
                document.querySelectorAll('.nav-item').forEach(item => {
                    item.classList.remove('active');
                });
            }
        }
    });
}

function initBootstrapComponents() {
    if (typeof bootstrap !== 'undefined') {
        const dropdownElementList = document.querySelectorAll('[data-bs-toggle="dropdown"]');
        const dropdownList = [...dropdownElementList].map(dropdownToggleEl => new bootstrap.Dropdown(dropdownToggleEl));
    } else {
        console.warn('Bootstrap is not loaded yet');
    }
}