clc;
clear all;
disp('DIJKISTRA ALGORITHM');
n=input('Enter the no. of nodes: ');
for i=1:n
    %initialize
    for j=i:n       
        if(i==j)
            m(i,j)=0;
        else
            m(i,j)=randint(1,1,9);% fill matrix
            if m(i,j) == 8
                m(i,j) = inf;
            end  
            m(j,i)=m(i,j);% equal upper and lower triangular matrix
        end
    end
end
disp(m);
 i=1;
 x=1;
 temp=triu(m); %for coloring of the lines after computing path
 for i=1:n
     for j=1:n
         if(temp(i,j)~=0)
             lc(i,j)=x;      %just numbering in sequence for line count
             lc(j,i)=lc(i,j);
             x=x+1;      
         end
     end
 end
bg=biograph(triu(m),[],'showarrows','off','ShowWeights','on','EdgeTextColor',[0 0 1]);
view(bg);
over=0;
while(over==0)
    from=input('Enter the source node no.: ');   %get inputs
    to=input('Enter the destination node no.: ');
    v=zeros(1,n);%visited matrix
    d=randint(1,n,100);%distance to node matrix
    p=zeros(1,n);%previous node matrix
    s=from;
    v(s)=1;%mark from as visited and initialixe d and p with 0
    d(s)=0;
    p(s)=0;
    stop=0;
    while(stop~=n)
    stop=0;
    for i=1:n
        if(v(i)~=1&&m(s,i)~=0)
            if(d(s)+m(s,i)<d(i))%if smaller than previous value replace
                d(i)=m(s,i)+d(s);
                p(i)=s;
            end
        else
            stop=stop+1;
        end
    end
    tempmat=d;
    for i=1:n
        if(v(i)==1)
            tempmat(i)=100;%to find the next minimum
        end
    end
    [k z]=min(tempmat);
    s=z;% next minimum node as source node
    v(s)=1; % mark as visited
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%computation over%%%%%%%%%%%%%%%%%
    no=1:n;
    fprintf('\nNodes:   ');
    disp(no);
    fprintf('Visited: ');
    disp(v);
    fprintf('Previous:');
    disp(p);
    i=1;
    out=2;
    dest(1)=to;
    while(i==1)     %backtrace from destination to source
         to=p(to);
         dest(out)=to;
         out=out+1;
         if(to==from)
             i=0;
         end
    end
    bg=biograph(triu(m),[],'showarrows','off','ShowWeights','on','EdgeTextColor',[0 0 1]);
    for i=1:out-1
    set(bg.nodes(dest(i)), 'color', [1 0 0]);
    set(bg.nodes(dest(1)),'color',[0 1 0]);
    if(i<out-1)
    set(bg.edges(lc(dest(i+1),dest(i))),'linecolor',[1 0 0]);
    end
    end
    view(bg);
    sample=input('Check Minimum distance for next instance y/n: ','s');
    if(sample=='n')
        over=1;  
    end
end