# Структура веток и конфликтов (Branch Structure and Conflicts)

Этот файл описывает структуру веток в репозитории и какие конфликты ожидаются при их слиянии.

## Диаграмма веток (Branch Diagram)

```
main (base)
│
├── feature-hello-enthusiastic     [изменяет строки 1, 3, 5 в hello.txt]
├── feature-hello-formal           [изменяет строки 1, 3, 5 в hello.txt]
│
├── feature-calc-divide            [добавляет divide() после multiply()]
├── feature-calc-power             [добавляет power() после multiply()]
│
├── feature-config-dev             [debug=true, max_users=10, environment=dev]
└── feature-config-prod            [version=2.0.0, max_users=1000, environment=prod]
```

## Детальное описание конфликтов (Detailed Conflict Description)

### 1. hello.txt конфликты

**База (Base):**
```
Hello World!
This is a file for practicing Git merge conflicts.
Line 3: Original content
Line 4: More original content
Line 5: Final line
```

**feature-hello-enthusiastic:**
```
Hello Amazing World!!!
This is a file for practicing Git merge conflicts.
Line 3: EXCITING NEW CONTENT!!!
Line 4: More original content
Line 5: Have a wonderful day!
```

**feature-hello-formal:**
```
Greetings, World.
This is a file for practicing Git merge conflicts.
Line 3: Updated professional content
Line 4: More original content
Line 5: Best regards
```

**Конфликтующие строки:** 1, 3, 5
**Сложность:** Простая - текстовые изменения

---

### 2. calculator.py конфликты

**База (Base):**
```python
def multiply(a, b):
    """Multiply two numbers"""
    return a * b

if __name__ == "__main__":
    print("Calculator ready")
    result = add(5, 3)
    print(f"5 + 3 = {result}")
```

**feature-calc-divide:**
```python
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
```

**feature-calc-power:**
```python
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
```

**Конфликтующие области:**
- Добавление новой функции после multiply()
- Изменение сообщения в print()
- Добавление тестового кода

**Правильное разрешение:** Включить обе функции (divide и power)
**Сложность:** Средняя - нужно объединить код функций

---

### 3. config.json конфликты

**База (Base):**
```json
{
  "app_name": "Training App",
  "version": "1.0.0",
  "debug": false,
  "max_users": 100
}
```

**feature-config-dev:**
```json
{
  "app_name": "Training App",
  "version": "1.0.0",
  "debug": true,
  "max_users": 10,
  "environment": "development"
}
```

**feature-config-prod:**
```json
{
  "app_name": "Training App",
  "version": "2.0.0",
  "debug": false,
  "max_users": 1000,
  "environment": "production"
}
```

**Конфликтующие поля:**
- `version`: 1.0.0 vs 2.0.0
- `debug`: true vs false
- `max_users`: 10 vs 1000
- `environment`: development vs production

**Правильное разрешение:** Зависит от контекста - выбрать dev или prod, или создать третий вариант
**Сложность:** Средняя - нужно понимать семантику конфигурации

---

## Рекомендуемый порядок практики (Recommended Practice Order)

1. **Начинающий уровень:**
   - Слияние feature-hello-enthusiastic и feature-hello-formal
   - Простые текстовые изменения, легко понять

2. **Средний уровень:**
   - Слияние feature-calc-divide и feature-calc-power
   - Конфликты в коде, нужно понимать логику

3. **Продвинутый уровень:**
   - Слияние feature-config-dev и feature-config-prod
   - Конфликты в структурированных данных (JSON)
   - Нужно принимать решения о бизнес-логике

4. **Экспертный уровень:**
   - Слияние всех веток последовательно
   - Множественные конфликты в разных файлах
   - Управление сложным состоянием

## Примеры разрешения (Resolution Examples)

### Пример 1: Объединение приветствий
```
Hello Amazing World!
This is a file for practicing Git merge conflicts.
Line 3: Updated content with excitement and professionalism
Line 4: More original content
Line 5: Best regards and have a wonderful day!
```

### Пример 2: Полный калькулятор
```python
def multiply(a, b):
    """Multiply two numbers"""
    return a * b

def divide(a, b):
    """Divide two numbers"""
    if b == 0:
        raise ValueError("Cannot divide by zero")
    return a / b

def power(a, b):
    """Raise a to the power of b"""
    return a ** b

if __name__ == "__main__":
    print("Advanced Calculator ready")
    result = add(5, 3)
    print(f"5 + 3 = {result}")
    result = divide(10, 2)
    print(f"10 / 2 = {result}")
    result = power(2, 8)
    print(f"2 ^ 8 = {result}")
```

### Пример 3: Гибридная конфигурация
```json
{
  "app_name": "Training App",
  "version": "2.0.0",
  "debug": false,
  "max_users": 500,
  "environment": "staging"
}
```
