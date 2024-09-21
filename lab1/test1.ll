; ModuleID = 'test1.c'
source_filename = "test1.c"
@.str = private unnamed_addr constant [8 x i8] c"Sum: %d\0A\00", align 1

define i32 @main() {
entry:
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %sum = alloca i32, align 4

  store i32 5, i32* %a, align 4
  store i32 7, i32* %b, align 4

  %val_a = load i32, i32* %a, align 4
  %val_b = load i32, i32* %b, align 4
  %sum_val = add i32 %val_a, %val_b
  store i32 %sum_val, i32* %sum, align 4

  %result = load i32, i32* %sum, align 4
  %fmt = getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0)
  call i32 (i8*, ...) @printf(i8* %fmt, i32 %result)

  ret i32 0
}

declare dso_local i32 @printf(i8*, ...) #0
attributes #0 = { nounwind }
