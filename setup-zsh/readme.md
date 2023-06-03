
         
เขียนอธิบายโปรเจค ตามโครงสร้างนี้ setup-zsh. แล้วเซฟลงในไฟล์ readme.md .├── jb.zsh-theme.├── main.sh

## อธิบายโปรเจกต์ Setup-zsh

โปรเจกต์ Setup-zsh เป็นโปรเจกต์ที่ใช้สำหรับตั้งค่า Zsh shell ในการแสดงผลเมนู shell prompt ที่สวยงามและสะดวกในการใช้งานมากยิ่งขึ้น โดยใน Repository นี้ประกอบไปด้วยไฟล์ .zsh-theme ซึ่งเป็น template สำหรับแสดงผลข้อมูลต่าง ๆ ที่ได้รับการตั้งค่าไว้แล้วและไฟล์ main.sh ซึ่งเป็น shell script ที่ใช้สำหรับการตั้งค่า Zsh shell เพื่อให้ใช้งานกับไฟล์ .zsh-theme ที่กำหนดไว้

### วิธีติดตั้ง

การติดตั้งโปรเจกต์ Setup-zsh สามารถทำได้ผ่านขั้นตอนดังนี้:

1. Clone repository โดยใช้คำสั่ง:

bash
git clone https://github.com/<username>/setup-zsh.git


2. เข้าไปใน directory ที่ clone repository มา:

bash
cd setup-zsh


### วิธีใช้งาน

หลังจาก Clone repository และเข้าไปใน directory ที่ Clone มาแล้ว สามารถรัน main.sh script เพื่อตั้งค่า zsh shell เป็น default prompt theme ได้โดยใช้คำสั่ง:

bash
./main.sh


การรันคำสั่งนี้จะทำให้ไฟล์ .zsh-theme กลายเป็น zsh shell prompt theme ที่ถูกต้อง

### การปรับแต่ง

หากต้องการปรับแต่งไฟล์ .zsh-theme หรือสร้าง theme ใหม่ๆ สามารถทำได้โดยการแก้ไขไฟล์เดิมหรือสร้างไฟล์ theme ใหม่โดยใช้ template จากไฟล์ .zsh-theme และเมื่อเสร็จสามารถเรียกใช้งาน theme ได้โดยการรัน main.sh script อีกครั้ง

### การอนุญาต

โปรเจกต์นี้ได้รับการอนุญาตภายใต้ MIT License สามารถอ่านรายละเอียดได้ที่ไฟล์ LICENSE ภายใน Repository
