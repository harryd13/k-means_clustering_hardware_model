import os
import re
def mul(a,b):
    f = open('Wallace16bit_tb.v', 'r')
    linelist = f.readlines()
    f.close

    # Re-open file here
    if(int(a)>int(b)):
        f2 = open('Wallace16bit_tb.v', 'w')
        for line in linelist:
            if re.findall('^\s*A\s*=',line):
                line ='     A = '+ a+ ';\n'
            if re.findall('^\s*B\s*=',line):
                line ='     B = '+ b+ ';\n'
        
            f2.write(line)
        f2.close()
    else:
        f2 = open('Wallace16bit_tb.v', 'w')
        for line in linelist:
            if re.findall('^\s*A\s*=',line):
                line ='     A = '+ b+ ';\n'
            if re.findall('^\s*B\s*=',line):
                line ='     B = '+ a+ ';\n'
        
            f2.write(line)
        f2.close()

    os.system("iverilog -o wall Wallace16bit.v")
    os.system("iverilog -o wall Wallace16bit_tb.v")
    os.system("vvp wall>>result3.txt")

    rf = open('result3.txt','r')
    rf.seek(0)
    reslist = rf.readlines()
    res = reslist[0].strip()
    result = int(res)
    open('result3.txt', 'w').close()
    rf.close
    return result

x = [12, 20, 28, 18, 29, 33, 24, 45, 45, 52, 51, 52, 55, 53, 55, 61, 64, 69, 72]
y = [39, 36, 30, 52, 54, 46, 55, 59, 63, 70, 66, 63, 58, 23, 14, 8, 19, 7, 24]

for i in range(len(x)):
    y1 = mul(str(x[i]),str(y[i]))
    print(y1)
