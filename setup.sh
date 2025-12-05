#!/bin/bash
# Setup script for creating practice branches locally
# Run this script after cloning the repository to set up all practice branches

echo "🔧 Setting up Git merge conflict training environment..."
echo ""

# Check if we're in a git repository
if [ ! -d .git ]; then
    echo "❌ Error: Not in a git repository. Please run this from the lesson_git directory."
    exit 1
fi

echo "📦 Creating feature branches for practice..."
echo ""

# Create base commit point
BASE_BRANCH="main"
git checkout $BASE_BRANCH 2>/dev/null || git checkout -b $BASE_BRANCH

# Feature branches for hello.txt (text conflicts)
echo "Creating text conflict branches..."
git checkout -b feature-hello-enthusiastic $BASE_BRANCH 2>/dev/null || git checkout feature-hello-enthusiastic
cat > hello.txt << 'EOF'
Hello Amazing World!!!
This is a file for practicing Git merge conflicts.
Line 3: EXCITING NEW CONTENT!!!
Line 4: More original content
Line 5: Have a wonderful day!
EOF
git add hello.txt
git commit -m "Add enthusiastic greetings to hello.txt" 2>/dev/null || echo "  Branch already exists"

git checkout $BASE_BRANCH
git checkout -b feature-hello-formal $BASE_BRANCH 2>/dev/null || git checkout feature-hello-formal
cat > hello.txt << 'EOF'
Greetings, World.
This is a file for practicing Git merge conflicts.
Line 3: Updated professional content
Line 4: More original content
Line 5: Best regards
EOF
git add hello.txt
git commit -m "Add formal greetings to hello.txt" 2>/dev/null || echo "  Branch already exists"

# Feature branches for calculator.py (code conflicts)
echo "Creating code conflict branches..."
git checkout $BASE_BRANCH
git checkout -b feature-calc-divide $BASE_BRANCH 2>/dev/null || git checkout feature-calc-divide
cat > calculator.py << 'EOF'
def add(a, b):
    """Add two numbers"""
    return a + b

def subtract(a, b):
    """Subtract two numbers"""
    return a - b

def multiply(a, b):
    """Multiply two numbers"""
    return a * b

def divide(a, b):
    """Divide two numbers"""
    if b == 0:
        raise ValueError("Cannot divide by zero")
    return a / b

if __name__ == "__main__":
    print("Calculator ready")
    result = add(5, 3)
    print(f"5 + 3 = {result}")
    result = divide(10, 2)
    print(f"10 / 2 = {result}")
EOF
git add calculator.py
git commit -m "Add divide function to calculator" 2>/dev/null || echo "  Branch already exists"

git checkout $BASE_BRANCH
git checkout -b feature-calc-power $BASE_BRANCH 2>/dev/null || git checkout feature-calc-power
cat > calculator.py << 'EOF'
def add(a, b):
    """Add two numbers"""
    return a + b

def subtract(a, b):
    """Subtract two numbers"""
    return a - b

def multiply(a, b):
    """Multiply two numbers"""
    return a * b

def power(a, b):
    """Raise a to the power of b"""
    return a ** b

if __name__ == "__main__":
    print("Advanced Calculator ready")
    result = add(5, 3)
    print(f"5 + 3 = {result}")
    result = power(2, 8)
    print(f"2 ^ 8 = {result}")
EOF
git add calculator.py
git commit -m "Add power function to calculator" 2>/dev/null || echo "  Branch already exists"

# Feature branches for config.json (config conflicts)
echo "Creating config conflict branches..."
git checkout $BASE_BRANCH
git checkout -b feature-config-dev $BASE_BRANCH 2>/dev/null || git checkout feature-config-dev
cat > config.json << 'EOF'
{
  "app_name": "Training App",
  "version": "1.0.0",
  "debug": true,
  "max_users": 10,
  "environment": "development"
}
EOF
git add config.json
git commit -m "Configure for development environment" 2>/dev/null || echo "  Branch already exists"

git checkout $BASE_BRANCH
git checkout -b feature-config-prod $BASE_BRANCH 2>/dev/null || git checkout feature-config-prod
cat > config.json << 'EOF'
{
  "app_name": "Training App",
  "version": "2.0.0",
  "debug": false,
  "max_users": 1000,
  "environment": "production"
}
EOF
git add config.json
git commit -m "Configure for production environment" 2>/dev/null || echo "  Branch already exists"

# Return to main branch
git checkout $BASE_BRANCH

echo ""
echo "✅ Setup complete!"
echo ""
echo "📋 Available branches:"
git branch | grep "feature-"
echo ""
echo "🚀 You can now start practicing! See QUICKSTART.md or README.md"
echo ""
echo "To see all branches visually:"
echo "  git log --graph --oneline --all --decorate"
