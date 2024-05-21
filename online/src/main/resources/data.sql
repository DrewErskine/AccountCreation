-- Insert roles
INSERT INTO roles (name) VALUES ('USER'), ('ADMIN') ON CONFLICT (name) DO NOTHING;

-- Insert users with hashed passwords and handle conflicts
INSERT INTO users (username, password) VALUES
('drew', '$2a$10$8AmDn58YBf0uHuw4bV8C5OkV.k8.0mYhM3iQ2oeRZfEotCbU/qnpq'),
('sara', '$2a$10$uUqsB4gO4Tt1zOi6MLvBiuZAlV5sX5Kso7JsoLoG0m/FSs.qXOE3W')
ON CONFLICT (username) DO UPDATE SET password = EXCLUDED.password;

-- Assign roles to users (assuming IDs of roles and users are known)
INSERT INTO user_roles (user_id, role_id) VALUES
((SELECT id FROM users WHERE username = 'drew'), (SELECT id FROM roles WHERE name = 'ADMIN')),
((SELECT id FROM users WHERE username = 'sara'), (SELECT id FROM roles WHERE name = 'USER'))
ON CONFLICT DO NOTHING;
