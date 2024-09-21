; 声明 printf 和 scanf 函数
declare i32 @printf(i8*, ...) #1
declare i32 @scanf(i8*, float*) #1

; 用于 printf 函数
@.str_printf = private unnamed_addr constant [6 x i8] c"%.2f\0A\00", align 1
; 用于 scanf 函数
@.str_scanf = private unnamed_addr constant [3 x i8] c"%f\00", align 1

; 主函数定义
define i32 @main() {
entry:
  ; 给 nums 分配空间，十个 float
  %nums = alloca [10 x float], align 8
  ; 给 increment 分配空间，四字节
  %increment = alloca float, align 4
  ; 给 i 分配空间，四字节
  %i = alloca i32, align 4

  ; 初始化 i 为 0
  store i32 0, i32* %i, align 4

  ; 读取第一个元素
  %0 = getelementptr [10 x float], [10 x float]* %nums, i32 0, i32 0
  %1 = call i32 @scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str_scanf, i32 0, i32 0), float* %0)

  ; 检查 scanf 是否成功
  %scanf_success_1 = icmp ne i32 %1, 0
  br i1 %scanf_success_1, label %read_success_1, label %read_failure

read_success_1:
  ; 读取递增步长
  %2 = call i32 @scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str_scanf, i32 0, i32 0), float* %increment)

  ; 检查 scanf 是否成功
  %scanf_success_2 = icmp ne i32 %2, 0
  br i1 %scanf_success_2, label %read_success_2, label %read_failure

read_success_2:
  ; 将 i 初始化为 1
  store i32 1, i32* %i, align 4

  ; 生成递增序列
  br label %generate_loop

generate_loop:
  ; 加载当前索引
  %gen_index = load i32, i32* %i, align 4
  %less_than_ten_gen = icmp slt i32 %gen_index, 10

  ; 如果索引小于 10，则继续循环
  br i1 %less_than_ten_gen, label %generate_body, label %generate_end

generate_body:
  ; 计算前一个元素的索引
  %gen_index_sub1 = sub i32 %gen_index, 1
  ; 获取前一个元素的地址
  %prev_element_ptr = getelementptr inbounds [10 x float], [10 x float]* %nums, i32 0, i32 %gen_index_sub1
  ; 加载前一个元素
  %prev_element = load float, float* %prev_element_ptr, align 4
  ; 加载递增步长
  %increment_value = load float, float* %increment, align 4
  ; 计算当前元素值
  %next_element = fadd float %prev_element, %increment_value
  ; 存储当前元素
  %curr_element_ptr = getelementptr inbounds [10 x float], [10 x float]* %nums, i32 0, i32 %gen_index
  store float %next_element, float* %curr_element_ptr, align 4

  ; 增加索引
  %increment_index_gen = add nsw i32 %gen_index, 1
  store i32 %increment_index_gen, i32* %i, align 4

  ; 继续循环
  br label %generate_loop

generate_end:
  ; 输出数组的最后一个元素
  ; 获取最后一个索引 (ARRAY_SIZE - 1)
  %last_index = sub i32 10, 1
  ; 获取最后一个元素的地址
  %last_element_ptr = getelementptr inbounds [10 x float], [10 x float]* %nums, i32 0, i32 %last_index
  ; 加载最后一个元素
  %last_element = load float, float* %last_element_ptr, align 4
  ; 扩展 float 为 double
  %last_element_ext = fpext float %last_element to double
  ; 打印最后一个元素
  %print_last = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str_printf, i32 0, i32 0), double %last_element_ext)

  ; 返回 0
  ret i32 0

read_failure:
  ; 处理读取失败的情况
  br label %end

end:
  ; 返回 0
  ret i32 0
}

attributes #1 = { noinline nounwind }
