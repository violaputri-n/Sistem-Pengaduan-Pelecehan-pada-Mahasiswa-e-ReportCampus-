#!/bin/bash

# Database setup dan migration
cd /c/xamppp/htdocs/pelecehan/pelecehan

echo "=== Running migrations ==="
php artisan migrate --force

echo ""
echo "=== Creating test user ==="
php artisan tinker << 'EOF'
use App\Models\User;

$user = User::firstOrCreate(
    ['email' => 'konselor@example.com'],
    [
        'name' => 'Konselor Test',
        'password' => bcrypt('password'),
        'role' => 'konselor'
    ]
);

echo "User ID: " . $user->id . "\n";
EOF

echo ""
echo "=== Setting up complete ==="
