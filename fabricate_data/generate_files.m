probs_g2=[0,0.2,0.7];
folders=["base/","control/","test/"];
nf=[12,6,6];
for c = 1:3
    prob_g2=probs_g2(c);
    folder=folders(c);
    if ~exist(folder, 'dir')
        mkdir(folder);
        disp(['Directory "', folder, '" created.']);
    else
        disp(['Directory "', folder, '" already exists']);
    end
    for i = 1:nf(c)
        name = folder+"inflammation-"+pad(string(i),2,'left','0')+".csv";
        disp(name+"   "+string(prob_g2))
        fabricate_data(filename=name,prob_group_2=prob_g2)
    end
end
