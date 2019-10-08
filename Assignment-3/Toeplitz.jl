
function convolute(a,b)
    len_a = length(a)
    len_b = length(b)
    len_c = len_a + len_b -1
    T_B = zeros(Float64, len_c, len_a)
    c = zeros(Float64, len_c)
    
    #Initialize T_B
    for j=1:len_a
        for i=j:len_c
            k = i-j+1
            if(k<=len_b)
                T_B[i,j] = b[k]
            else
                T_B[i,j] = 0
            end
        end
    end
    
    #Multiply T(B) with a to get c
    for i=1:len_c
        for j=1:1
            sum = 0
            for k=1:len_a
                sum+=T_B[i,k]*a[k]
            end
            c[i,j] = sum
        end
    end

    return c
end

u = Array{Int64}(undef, 50) 
for i=1:50 
    x = rand(Int,1) 
    if(x[1]%2==0) 
        u[i]=1 
    else 
        u[i]=-1 
    end 
end

c = [1,0.7,-0.3]
y = convolute(u, c)

using Plots
pyplot()
plot([y])



h = [0.9, -0.5, 0.5, -0.4, 0.3, -0.3, 0.2, -0.1]
z = convolute(y, h)
plot([z])


using DSP
a=[1]
b=[1,2]
c = conv(a,b)
print(c)
