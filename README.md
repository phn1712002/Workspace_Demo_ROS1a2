# ROS Workspace Demo

Workspace mẫu này được thiết kế để hỗ trợ phát triển ứng dụng robot trên cả ROS1 và ROS2.

## Cấu trúc thư mục

```
.
├── ai_ws/              # Workspace cho AI/ML
├── catkin_ws/          # Workspace ROS1 (Catkin)
│   └── src/            # Chứa các package ROS1
├── colcon_ws/          # Workspace ROS2 (Colcon)  
│   └── src/            # Chứa các package ROS2
├── simulation_ws/      # Workspace cho mô phỏng
├── firmware_ws/        # Workspace cho mã nguồn MCU
├── ui_ws/              # Workspace cho giao diện người dùng
├── mcad_ws/            # Workspace cho liên quan cơ khí 3D, 2D
├── ecad_ws/            # Workspace cho mạch điện tử, hệ thống điện
├── other_ws/           # Workspace cho thành phần khác của dự án
├── install/            # Các script cài đặt yêu cầu
├── auto_source.sh      # Script tự động source environment
└── install_ws.sh       # Script cài đặt workspace
```

## Thiết lập ban đầu
1. Tải demo 
```bash
git clone https://github.com/phn1712002/workspace_demo_ros1a2.git {name_project}
cd {name_project}
```

2. Khởi tạo workspace:
```bash
bash ./install_ws.sh
```

3. Tải các thứ liên quan:
```bash
# Đối với ROS1
cd catkin_ws/src/
bash git_clone.sh
bash run_bash.sh
```
```bash
# Đối với ROS22
cd colcon_ws/src/
bash git_clone.sh
bash run_bash.sh
```

## Tiện ích

### Tiện ích workspace
- `install_ws.sh`: Tự động tạo workspace và cấu trúc thư mục cơ bản
- `auto_source.sh`: Tự động source environment ROS khi mở terminal

### Tiện tích git, bash
- `git_clone.sh`: Script tự động clone các repository git 
- `run_bash.sh`: Script tự động các lệnh cần thiết trong linux

## Ghi chú

- Để thêm package mới, tạo thư mục package trong `src/` tương ứng (ROS1/ROS2)
- Các workspace khác (ai_ws, simulation_ws, ui_ws, mcad_ws, ecad_ws, other_ws) có thể được cấu hình tùy theo nhu cầu

## Liên hệ
1. Tác giả : Phạm Hoàng Nam
2. Gmail : phn1712002@gmail.com