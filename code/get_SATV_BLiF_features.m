function result = get_SATV_BLiF_features(dis_LF,mappingtable)

    [U, V, H, W] = size(dis_LF);
    rotate_bais = [[0,1];[-1,1];[-1,0];[-1,-1];[0,-1];[1,-1];[1,0];[1,1]];
    result_A = zeros(U-2, V-2, H-2, W-2);
    result_S = zeros(U-2, V-2, H-2, W-2);
    result = zeros(U-2, V-2, H-2, W-2);
    for i=1:size(rotate_bais,1)
        v = 2^(i-1);
        A = dis_LF(2+rotate_bais(i,1):end-1+rotate_bais(i,1),2+rotate_bais(i,2):end-1+rotate_bais(i,2),2:end-1,2:end-1) ...
            >= dis_LF(2:end-1,2:end-1,2:end-1,2:end-1);
        result_A = result_A + v*A;
        S = dis_LF(2:end-1,2:end-1,2+rotate_bais(i,1):end-1+rotate_bais(i,1),2+rotate_bais(i,2):end-1+rotate_bais(i,2)) ...
            >= dis_LF(2:end-1,2:end-1,2:end-1,2:end-1);
        result_S = result_S + v*S;
    end
    for u=1:U-2
        for v=1:V-2
            for h=1:H-2
                for w=1:W-2   
                    result(u,v,h,w) = mappingtable(result_A(u,v,h,w)+1)*10 + mappingtable(result_S(u,v,h,w)+1);          
                end
            end
        end
    end
    result = hist(result(:),0:99);
    result = result/(sum(result));
    