-- First, clear existing categories if any
TRUNCATE TABLE product_categories;

-- Insert main categories
INSERT INTO product_categories (name, slug, description, parent_id) VALUES
('Clothing', 'clothing', 'Fashion and apparel for all ages', NULL),
('Electronics', 'electronics', 'Latest gadgets and electronic devices', NULL),
('Accessories', 'accessories', 'Fashion accessories and more', NULL),
('Beauty & Health', 'beauty-health', 'Beauty products and health essentials', NULL),
('Home Essentials', 'home-essentials', 'Everything you need for your home', NULL),
('Sale', 'sale', 'Special offers and discounted items', NULL);

-- Insert clothing subcategories
INSERT INTO product_categories (name, slug, description, parent_id) VALUES
('Men''s Wear', 'mens-wear', 'Clothing for men', (SELECT id FROM product_categories WHERE slug = 'clothing')),
('Women''s Wear', 'womens-wear', 'Clothing for women', (SELECT id FROM product_categories WHERE slug = 'clothing')),
('Kids Wear', 'kids-wear', 'Clothing for children', (SELECT id FROM product_categories WHERE slug = 'clothing'));

-- Insert electronics subcategories
INSERT INTO product_categories (name, slug, description, parent_id) VALUES
('Smartphones', 'smartphones', 'Mobile phones and accessories', (SELECT id FROM product_categories WHERE slug = 'electronics')),
('Laptops', 'laptops', 'Laptops and notebooks', (SELECT id FROM product_categories WHERE slug = 'electronics')),
('Audio Devices', 'audio-devices', 'Headphones, speakers and more', (SELECT id FROM product_categories WHERE slug = 'electronics')); 