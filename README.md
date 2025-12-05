# Git Merge Conflicts Training

Это учебный репозиторий для практики работы с конфликтами слияния в Git.
(This is a training repository for practicing Git merge conflicts.)

## Структура (Structure)

Репозиторий содержит:
- `hello.txt` - простой текстовый файл
- `calculator.py` - Python файл с функциями
- `config.json` - конфигурационный файл

## Доступные ветки для практики (Available Practice Branches)

### Текстовые конфликты (Text Conflicts)
- `feature-hello-enthusiastic` - восторженное приветствие
- `feature-hello-formal` - формальное приветствие

### Конфликты в коде (Code Conflicts)
- `feature-calc-divide` - добавляет функцию деления
- `feature-calc-power` - добавляет функцию возведения в степень

### Конфликты в конфигурации (Config Conflicts)
- `feature-config-dev` - настройки для разработки
- `feature-config-prod` - настройки для продакшена

## Как практиковаться (How to Practice)

### Сценарий 1: Простой текстовый конфликт
Попробуйте слить две ветки с изменениями в `hello.txt`:

```bash
# Создайте новую ветку для экспериментов
git checkout -b practice-merge

# Слейте первую ветку
git merge feature-hello-enthusiastic

# Теперь попробуйте слить вторую ветку - будет конфликт!
git merge feature-hello-formal

# Откройте hello.txt и разрешите конфликт
# Файл будет содержать маркеры:
# <<<<<<< HEAD
# ... ваши изменения ...
# =======
# ... входящие изменения ...
# >>>>>>> feature-hello-formal

# После разрешения конфликта:
git add hello.txt
git commit -m "Resolve merge conflict"
```

### Сценарий 2: Конфликт в Python коде
```bash
git checkout copilot/train-github-conflicts
git checkout -b practice-calculator

# Слейте обе ветки с функциями
git merge feature-calc-divide
git merge feature-calc-power  # Конфликт!

# Разрешите конфликт, убедившись что обе функции присутствуют
# и код работает корректно
git add calculator.py
git commit -m "Merge both calculator features"
```

### Сценарий 3: Конфликт в JSON конфигурации
```bash
git checkout copilot/train-github-conflicts
git checkout -b practice-config

git merge feature-config-dev
git merge feature-config-prod  # Конфликт!

# Разрешите конфликт в JSON файле
# Убедитесь что JSON остается валидным!
git add config.json
git commit -m "Merge config changes"
```

### Продвинутый сценарий: 3-way merge
```bash
# Создайте ситуацию со множественными конфликтами
git checkout copilot/train-github-conflicts
git checkout -b practice-complex

git merge feature-hello-enthusiastic
git merge feature-calc-divide
git merge feature-config-dev

# Теперь попробуйте слить противоречащие ветки
git merge feature-hello-formal       # Конфликт в hello.txt
git merge feature-calc-power         # Конфликт в calculator.py
git merge feature-config-prod        # Конфликт в config.json
```

## Полезные команды (Useful Commands)

- `git status` - проверить статус и увидеть конфликтующие файлы
- `git diff` - посмотреть изменения
- `git diff --ours` - посмотреть вашу версию
- `git diff --theirs` - посмотреть входящую версию
- `git merge <branch>` - слить ветку
- `git merge --abort` - отменить слияние при конфликте
- `git add <file>` - пометить конфликт как разрешенный
- `git commit` - завершить слияние
- `git log --graph --oneline --all` - визуализация веток
- `git checkout --ours <file>` - принять вашу версию файла
- `git checkout --theirs <file>` - принять их версию файла

## Советы (Tips)

1. **Читайте маркеры конфликтов:**
   - `<<<<<<< HEAD` - начало ваших изменений
   - `=======` - разделитель версий
   - `>>>>>>> branch-name` - конец входящих изменений

2. **Стратегии разрешения:**
   - Принять только свои изменения
   - Принять только их изменения
   - Объединить оба изменения (часто лучший вариант)
   - Создать новое решение

3. **После разрешения:**
   - Тщательно проверьте код
   - Убедитесь что синтаксис правильный
   - Протестируйте функциональность
   - Удалите все маркеры конфликтов

4. **Предотвращение конфликтов:**
   - Чаще делайте pull/merge из основной ветки
   - Разделяйте работу по разным файлам
   - Согласуйте изменения с командой

## Проверка понимания (Self-Check)

После практики вы должны уметь:
- [ ] Распознавать маркеры конфликтов в файлах
- [ ] Выбирать правильную стратегию разрешения
- [ ] Разрешать конфликты в текстовых файлах
- [ ] Разрешать конфликты в коде
- [ ] Разрешать конфликты в JSON/конфигурациях
- [ ] Использовать git add для маркировки разрешенных конфликтов
- [ ] Завершать слияние после разрешения всех конфликтов
- [ ] Отменять слияние если что-то пошло не так