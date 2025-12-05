# 🧩 **C++ Coding Standards – General Rules**

## 📋 Overview

Tài liệu này định nghĩa quy chuẩn lập trình C++ chung, bao gồm: đặt tên, comment, cấu trúc class/hàm, tổ chức file header/source, code style và best practices theo C++17/C++20.

---

## 🏷️ Naming Rules

### 1. Class / Struct Names

- **PascalCase**

- Ví dụ: `DataProcessor`, `UserProfile`, `HttpClient`

### 2. Function / Method Names

- **snake_case**

- Ví dụ: `load_data()`, `process_request()`, `save_to_db()`

### 3. Variable Names

- **snake_case**

- Ví dụ: `user_id`, `config_path`, `max_retries`

### 4. Member Variables

- **snake_case + hậu tố `_` cho private**

- Ví dụ:
  
  ```cpp
  int connection_count_;
  std::string cache_path_;
  ```

### 5. Constants

- **UPPER_SNAKE_CASE**

- Ví dụ: `MAX_CONNECTIONS`, `DEFAULT_TIMEOUT`

### 6. Namespaces

- **lowercase**

- Ví dụ: `network`, `utils`, `core`

---

## 💬 Commenting Rules

### 1. Doc Comments (Doxygen)

- Sử dụng `///` hoặc `/** ... */` theo chuẩn Doxygen.
  
  ```cpp
  /// Establish a connection to a given URL.
  /// @param url Target URL
  /// @param timeout Timeout in milliseconds
  /// @return true if connection succeeds
  bool connect(const std::string& url, int timeout = 30000);
  ```

### 2. Inline Comments

- Ngắn gọn, rõ ý.
  
  ```cpp
  // Retry up to MAX_RETRIES
  for (int i = 0; i < MAX_RETRIES; ++i) {
      ...
  }
  ```

### 3. TODO / FIXME

```cpp
// TODO: Add async version of connect()
// FIXME: Optimize memory allocations
```

---

## 📝 Function & Method Rules

1. **Function Signature**
   
   - Đặt type rõ ràng, tránh auto nếu gây mơ hồ.

```cpp
int compute_score(const std::vector<int>& values);
```

2. **const correctness**
   
   - Ưu tiên dùng `const` với input không thay đổi.

3. **Function Length**
   
   - Không quá 50 dòng. Tách nhỏ khi có thể.

4. **Return Values**
   
   - Rõ ràng, ưu tiên dùng `enum class`, `std::optional`, `std::variant`.

5. **Error Handling**
   
   - Tránh trả mã lỗi bằng integer thô.
   
   - Ưu tiên exception hoặc `std::expected` (nếu có).

---

## 📁 File Organization Rules

### 1. Include Order

```cpp
// Standard library
#include <iostream>
#include <vector>

// Third-party libraries
#include <spdlog/spdlog.h>

// Project headers
#include "core/base_class.h"
#include "utils/config_loader.h"
```

### 2. Header File Structure

```cpp
#ifndef USER_SERVICE_H_
#define USER_SERVICE_H_

#include <string>

namespace user {

class UserService {
 public:
  bool load_user(int user_id);
 private:
  std::string cache_path_;
};

}  // namespace user

#endif  // USER_SERVICE_H_
```

### 3. File Naming

- **snake_case**

- Ví dụ: `http_client.cpp`, `data_loader.h`

---

## 🔧 Code Style and Formatting

- **Indentation**: 2 hoặc 4 spaces (tuân theo project)

- **Line Length**: ≤ 120 ký tự

- **Braces**: kiểu Allman hoặc K&R, nhưng thống nhất toàn project
  
  ```cpp
  if (is_ready) {
      start();
  }
  ```

- **Whitespace**
  
  - Có space quanh toán tử: `a + b`
  
  - Không có space trong dấu ngoặc: `func(x, y)`

---

## 🚀 Best Practices

1. **Smart Pointers**
   
   - Dùng `std::unique_ptr`, `std::shared_ptr`, tránh raw pointer.

2. **Avoid Magic Numbers**
   
   - Dùng `constexpr` hoặc constant.

3. **Avoid `new` / `delete` trực tiếp**
   
   - Ưu tiên RAII.

4. **Pass by Reference**
   
   - Dùng `const std::string&` thay vì copy.

5. **Use enum class**
   
   - Tránh enum kiểu cũ.

6. **Prefer std containers**
   
   - vector > raw array

7. **Minimize global state**
   
   - Tránh biến global nếu không cần thiết.

---

## 🔍 Code Review Checklist

- Đúng naming convention

- Đủ Doxygen comment

- const-correctness

- Không dùng magic number

- Không dùng raw pointer không cần thiết

- Class nhỏ, hàm < 50 dòng

- Không duplicate code

- Memory safety (RAII, smart pointers)

- Performance hợp lý (reserve, move semantics, references)
