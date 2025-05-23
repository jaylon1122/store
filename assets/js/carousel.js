class Carousel {
    constructor(container) {
        this.container = container;
        this.slides = Array.from(container.getElementsByClassName('carousel-slide'));
        this.dots = Array.from(container.getElementsByClassName('carousel-dot'));
        this.currentSlide = 0;
        this.interval = null;
        this.init();
    }

    init() {
        // Show first slide
        this.showSlide(0);
        
        // Start automatic sliding
        this.startAutoSlide();

        // Add click events to dots
        this.dots.forEach((dot, index) => {
            dot.addEventListener('click', () => {
                this.showSlide(index);
                this.resetAutoSlide();
            });
        });

        // Pause on hover
        this.container.addEventListener('mouseenter', () => this.stopAutoSlide());
        this.container.addEventListener('mouseleave', () => this.startAutoSlide());
    }

    showSlide(index) {
        // Remove active class from current slide and dot
        this.slides[this.currentSlide].classList.remove('active');
        this.dots[this.currentSlide].classList.remove('active');

        // Update current slide index
        this.currentSlide = index;

        // Add active class to new slide and dot
        this.slides[this.currentSlide].classList.add('active');
        this.dots[this.currentSlide].classList.add('active');
    }

    nextSlide() {
        const nextIndex = (this.currentSlide + 1) % this.slides.length;
        this.showSlide(nextIndex);
    }

    startAutoSlide() {
        this.interval = setInterval(() => this.nextSlide(), 5000);
    }

    stopAutoSlide() {
        clearInterval(this.interval);
    }

    resetAutoSlide() {
        this.stopAutoSlide();
        this.startAutoSlide();
    }
}

// Initialize all carousels when the DOM is loaded
document.addEventListener('DOMContentLoaded', () => {
    const carousels = document.querySelectorAll('.carousel-container');
    carousels.forEach(carousel => new Carousel(carousel));
}); 