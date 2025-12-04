// Toggle mobile menu
function toggleMobileMenu() {
    const nav = document.getElementById('mainNavigation');
    nav.classList.toggle('active');

    // Prevent body scroll when menu is open
    if (nav.classList.contains('active')) {
        document.body.style.overflow = 'hidden';
    } else {
        document.body.style.overflow = '';
    }
}

// Close mobile menu when clicking outside
document.addEventListener('click', function (event) {
    const nav = document.getElementById('mainNavigation');
    const menuToggle = document.querySelector('.mobile-menu-toggle');

    if (nav.classList.contains('active') &&
        !nav.contains(event.target) &&
        !menuToggle.contains(event.target)) {
        toggleMobileMenu();
    }
});

// Mobile submenu toggle
document.querySelectorAll('.nav-item').forEach(item => {
    item.addEventListener('click', function (e) {
        if (window.innerWidth <= 991) {
            const submenu = this.querySelector('.submenu-container');
            if (submenu) {
                e.preventDefault();
                this.classList.toggle('active');
            }
        }
    });
});

// Smooth scroll for anchor links
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        e.preventDefault();
        const target = document.querySelector(this.getAttribute('href'));
        if (target) {
            target.scrollIntoView({
                behavior: 'smooth',
                block: 'start'
            });
        }
    });
});

// Add active class to current nav item
const currentLocation = window.location.pathname;
const navLinks = document.querySelectorAll('.nav-link-primary');

navLinks.forEach(link => {
    if (link.getAttribute('href') === currentLocation) {
        link.style.color = '#3498db';
        link.style.fontWeight = '700';
    }
});

// Cart functionality (demo)
let cartCount = 0;
const cartBadge = document.querySelector('.cart-badge');

function updateCartCount(count) {
    cartCount = count;
    cartBadge.textContent = cartCount;
    if (cartCount > 0) {
        cartBadge.style.display = 'flex';
    } else {
        cartBadge.style.display = 'none';
    }
}

// Initialize cart count
updateCartCount(0);

// Header scroll effect
let lastScroll = 0;
const header = document.querySelector('.site-header');

window.addEventListener('scroll', () => {
    const currentScroll = window.pageYOffset;

    if (currentScroll <= 0) {
        header.style.boxShadow = '0 2px 5px rgba(0, 0, 0, 0.05)';
    } else {
        header.style.boxShadow = '0 2px 10px rgba(0, 0, 0, 0.1)';
    }

    lastScroll = currentScroll;
});

// ===== Account dropdown toggle =====
// const accountLink = document.getElementById('accountLink');
// const accountMenu = document.getElementById('accountMenu');
//
// if (accountLink && accountMenu) {
//     accountLink.addEventListener('click', function(e) {
//         e.preventDefault();
//         accountMenu.classList.toggle('active');
//     });
//
//     // Close dropdown when clicking outside
//     document.addEventListener('click', function(e) {
//         if (!accountLink.contains(e.target) && !accountMenu.contains(e.target)) {
//             accountMenu.classList.remove('active');
//         }
//     });
// }
