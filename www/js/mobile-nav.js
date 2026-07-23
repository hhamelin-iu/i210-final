document.addEventListener('DOMContentLoaded', () => {
    const navToggle = document.querySelector('.nav-toggle');
    const navCollapse = document.querySelector('.nav-collapse');

    if (!navToggle || !navCollapse) return;

    navToggle.addEventListener('click', (e) => {
        e.stopPropagation();
        const expanded = navToggle.getAttribute('aria-expanded') === 'true' || false;
        navToggle.setAttribute('aria-expanded', !expanded);
        navToggle.classList.toggle('is-active');
        navCollapse.classList.toggle('is-open');

        if (!expanded) {
            document.body.style.overflow = 'hidden';
        } else {
            document.body.style.overflow = '';
        }
    });

    // Close mobile nav when clicking a nav link
    const navLinks = navCollapse.querySelectorAll('a');
    navLinks.forEach(link => {
        link.addEventListener('click', () => {
            navToggle.setAttribute('aria-expanded', 'false');
            navToggle.classList.remove('is-active');
            navCollapse.classList.remove('is-open');
            document.body.style.overflow = '';
        });
    });

    // Close when clicking outside the nav header
    document.addEventListener('click', (event) => {
        const isClickInside = navCollapse.contains(event.target) || navToggle.contains(event.target);
        if (!isClickInside && navCollapse.classList.contains('is-open')) {
            navToggle.setAttribute('aria-expanded', 'false');
            navToggle.classList.remove('is-active');
            navCollapse.classList.remove('is-open');
            document.body.style.overflow = '';
        }
    });

    // Handle resize to close drawer if expanded to desktop
    window.addEventListener('resize', () => {
        if (window.innerWidth > 992 && navCollapse.classList.contains('is-open')) {
            navToggle.setAttribute('aria-expanded', 'false');
            navToggle.classList.remove('is-active');
            navCollapse.classList.remove('is-open');
            document.body.style.overflow = '';
        }
    });
});
