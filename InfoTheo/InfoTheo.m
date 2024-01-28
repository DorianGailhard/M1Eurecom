function main()
    for i=1:12
        launch(20,i,i,10,false);
    end

end

function launch(K,M,N,SNR,CSIT)
    P = 10^(SNR/10);

    capacities = zeros(1,3000);

    for i= 1:3000
        capacities(i) = capacity(M,N,P,channel(K,M,N),CSIT);
    end
    
    
    
    hold on
    cdfplot(capacities);
    title("CDF of capacity for the strong LOS case (K=80, N+M=12, no CSIT");
    xlabel("x (information bits per channel use)");
    ylabel("P(Capacity <= x)");
    legend("M=1","M=2","M=3","M=4","M=5","M=6","M=7","M=8","M=9","M=10","M=11");
    %legend("AWGN","Rayleigh fading");
    hold off
end

function H = channel(K,M,N)
    Hlos = ones(N,M);
    Hr = complex(rand(N, M)-1/2*ones(N,M), rand(N, M)-1/2*ones(N,M))*sqrt(6); %sqrt(24) because we need to normalize
    
    H = sqrt(K/(K+1))*Hlos + sqrt(1/(K+1))*Hr;
    %H = Hlos;
end


function res = capacity(M,N,P,H, CSIT)
    if (CSIT)
        [U,S,V] = svd(H);

        mu = 0;
        coef = zeros(1,M);

        for i = 1:M
            if (M<=N || N >=i)
               coef(i) = max(0,mu - 1/S(i,i)^2);
            else
                coef(i) = 0;
            end
        end

        A = diag(coef);

        while (trace(A) < P)
           mu = mu + 0.1;

           for i = 1:M
            if (M<=N || N >=i)
               coef(i) = max(0,mu - 1/S(i,i)^2);
            else
                coef(i) = 0;
            end
           end

           A = diag(coef);
        end

        Q = V*A*(V');
        res = log2 ( det( eye(N) + H*Q*(H') ) );
    else
        Q = P/M * eye(M);
        res = log2 ( det( eye(N) + H*Q*(H') ) );
    end
end


















