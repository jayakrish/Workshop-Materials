; ModuleID = 'gcd_example.bc'

define i32 @gcd(i32 %x, i32 %y) {
entry:
  %tmp = icmp eq i32 %x, %y
  br i1 %tmp, label %return, label %cond_false

cond_false:                                       ; preds = %entry
  %tmp1 = icmp ult i32 %x, %y
  br i1 %tmp1, label %cond_true, label %cond_false_2

cond_true:                                        ; preds = %cond_false
  %tmp2 = sub i32 %y, %x
  %tmp3 = call i32 @gcd(i32 %x, i32 %tmp2)
  ret i32 %tmp3

cond_false_2:                                     ; preds = %cond_false
  %tmp4 = sub i32 %x, %y
  %tmp5 = call i32 @gcd(i32 %tmp4, i32 %y)
  ret i32 %tmp5

return:                                           ; preds = %entry
  ret i32 %x
}
