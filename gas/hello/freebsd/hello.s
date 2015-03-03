.data

msg: .asciz "Hello World!\n"
.set len, .-msg

.set sys_exit, 1
.set sys_write, 4
.set stdout, 1
.set kernel, 0x80

.text

.globl start

start:
  push $len
  push $msg
  push $stdout
  mov $sys_write, %eax
  sub $4, %esp
  int $kernel
  add $16, %esp /* $4 + $4 * 3 */

  push $0
  mov $sys_exit, %eax
  sub $4, %esp
  int $kernel
