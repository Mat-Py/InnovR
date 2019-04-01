function rep=are_segments_adjacent(E1, E2)
nb_shared = 0;

for lin=[1, 2]
    for p1=E1(1, :)
        for p2=E2(1, :)
            if p1 == p2
                nb_shared = nb_shared +1;

            end
        end
    end
end


rep = nb_shared >= 2;